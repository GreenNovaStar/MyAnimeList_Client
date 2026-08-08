import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/model/list_status_type.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/ui/components/nova/nova_choice_chip.dart';
import 'package:android_app/ui/components/nova/nova_error_snackbar.dart';
import 'package:android_app/ui/components/nova/nova_slider.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/formatters/mal_date.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// Outcome of a completed editor session: [status] is the saved entry, or
/// null when the entry was deleted. Distinct from [MediaListEditor.show]
/// resolving to null, which means the sheet was dismissed without saving.
typedef ListEditResult = ({MyListStatus? status});

/// Bottom-sheet editor for the signed-in user's list entry (anime or manga).
/// Progress tracks episodes watched for anime and chapters read for manga.
// ponytail: chapters only for manga; add a volumes field if volume tracking matters.
class MediaListEditor extends StatefulWidget {
  final int id;
  final MediaKind kind;
  final int? progressTotal; // total episodes (anime) or chapters (manga)
  final MALUserClient client;
  final MyListStatus? currentStatus;

  const MediaListEditor({
    super.key,
    required this.id,
    required this.kind,
    required this.client,
    this.progressTotal,
    this.currentStatus,
  });

  static Future<ListEditResult?> show(
    BuildContext context, {
    required int id,
    required MediaKind kind,
    required MALUserClient client,
    int? progressTotal,
    MyListStatus? currentStatus,
  }) {
    return showModalBottomSheet<ListEditResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => MediaListEditor(
        id: id,
        kind: kind,
        client: client,
        progressTotal: progressTotal,
        currentStatus: currentStatus,
      ),
    );
  }

  @override
  State<MediaListEditor> createState() => _MediaListEditorState();
}

class _MediaListEditorState extends State<MediaListEditor> {
  late String _status;
  late int _score;
  late int _progress;
  late final TextEditingController _progressController;
  DateTime? _startDate;
  DateTime? _finishDate;
  bool _saving = false;

  bool get _isAnime => widget.kind == MediaKind.anime;

  String get _progressLabel => _isAnime ? 'Episodes' : 'Chapters';

  /// The status choices for this media type, flattened to (value, label,
  /// color) so the chip row doesn't care which enum they came from.
  List<({String value, String label, Color color})> get _statuses =>
      switch (widget.kind) {
        MediaKind.anime => [
          for (final s in AnimeListStatus.values)
            (value: s.value, label: s.label, color: s.color),
        ],
        MediaKind.manga => [
          for (final s in MangaListStatus.values)
            (value: s.value, label: s.label, color: s.color),
        ],
      };

  @override
  void initState() {
    super.initState();
    final current = widget.currentStatus;
    _status =
        current?.status ??
        (_isAnime
            ? AnimeListStatus.planToWatch.value
            : MangaListStatus.planToRead.value);
    _score = current?.score ?? 0;
    _progress =
        (_isAnime ? current?.numEpisodesWatched : current?.numChaptersRead) ??
        0;
    _startDate = parseMalDate(current?.startDate);
    _finishDate = parseMalDate(current?.finishDate);
    _progressController = TextEditingController(text: '$_progress');
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  /// Runs a list mutation with the shared saving/error scaffolding: flips the
  /// saving flag, pops the sheet with [mutate]'s result on success, and shows
  /// the error snackbar (re-enabling the form) on failure.
  Future<void> _runMutation(Future<MyListStatus?> Function() mutate) async {
    setState(() => _saving = true);
    try {
      final result = await mutate();
      if (mounted) Navigator.pop(context, (status: result));
    } catch (e) {
      if (mounted) {
        showNovaErrorSnackbar(context, e);
        setState(() => _saving = false);
      }
    }
  }

  Future<void> _save() {
    final startDate = _startDate != null ? formatMalDate(_startDate!) : null;
    final finishDate = _finishDate != null ? formatMalDate(_finishDate!) : null;
    return _runMutation(
      () => switch (widget.kind) {
        MediaKind.anime => widget.client.updateMyAnimeListStatus(
          widget.id,
          status: _status,
          score: _score,
          numWatchedEpisodes: _progress,
          startDate: startDate,
          finishDate: finishDate,
        ),
        MediaKind.manga => widget.client.updateMyMangaListStatus(
          widget.id,
          status: _status,
          score: _score,
          numChaptersRead: _progress,
          startDate: startDate,
          finishDate: finishDate,
        ),
      },
    );
  }

  Future<void> _delete() async {
    final medium = _isAnime ? 'anime' : 'manga';
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove from list?'),
        content: Text('This will delete your list entry for this $medium.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await _runMutation(() async {
      switch (widget.kind) {
        case MediaKind.anime:
          await widget.client.deleteMyAnimeListStatus(widget.id);
        case MediaKind.manga:
          await widget.client.deleteMyMangaListStatus(widget.id);
      }
      return null;
    });
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initial = (isStart ? _startDate : _finishDate) ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _finishDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        left: NovaSize.spaceLg,
        right: NovaSize.spaceLg,
        top: NovaSize.spaceLg,
        bottom: MediaQuery.of(context).viewInsets.bottom + NovaSize.spaceLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit List Entry',
                style: NovaType.headline.copyWith(color: scheme.onSurface),
              ),
              if (widget.currentStatus != null) ...[
                const SizedBox(height: NovaSize.spaceSm),
                IconButton(
                  onPressed: _saving ? null : _delete,
                  icon: Icon(Icons.delete, semanticLabel: 'Remove from List'),
                  color: Colors.redAccent,
                ),
              ],
            ],
          ),

          const SizedBox(height: NovaSize.spaceLg),
          // Status chips
          Wrap(
            spacing: NovaSize.spaceSm,
            runSpacing: NovaSize.spaceSm,
            children: _statuses
                .map(
                  (s) => NovaChoiceChip(
                    label: s.label,
                    selected: _status == s.value,
                    color: s.color,
                    onSelected: () => setState(() => _status = s.value),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: NovaSize.spaceMd),

          // Score
          NovaSlider(
            label: 'Score',
            value: _score.toDouble(),
            min: 0,
            max: 10,
            divisions: 10,
            valueLabel: _score == 0 ? '–' : '$_score',
            suffix: _score == 0 ? '–' : '$_score',
            onChanged: (v) => setState(() => _score = v.round()),
          ),
          const SizedBox(height: NovaSize.spaceMd),

          // Progress (episodes watched / chapters read)
          if (widget.progressTotal != null && widget.progressTotal! > 0)
            NovaSlider(
              label: _progressLabel,
              value: _progress.toDouble(),
              min: 0,
              max: widget.progressTotal!.toDouble(),
              divisions: widget.progressTotal!,
              valueLabel: '$_progress',
              suffix: '$_progress / ${widget.progressTotal}',
              onChanged: (v) => setState(() => _progress = v.round()),
            )
          else
            Row(
              children: [
                Text(
                  _progressLabel,
                  style: NovaType.label.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: NovaSize.spaceMd),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _progressController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: NovaSize.spaceSm,
                        vertical: NovaSize.spaceSm,
                      ),
                    ),
                    onChanged: (v) {
                      final parsed = int.tryParse(v);
                      if (parsed != null && parsed >= 0) {
                        setState(() => _progress = parsed);
                      }
                    },
                  ),
                ),
              ],
            ),
          const SizedBox(height: NovaSize.spaceMd),

          // Dates
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pickDate(isStart: true),
                  icon: const Icon(Icons.calendar_today, size: 16),
                  label: Text(
                    _startDate != null
                        ? formatMalDate(_startDate!)
                        : 'Start Date',
                    style: NovaType.label,
                  ),
                ),
              ),
              const SizedBox(width: NovaSize.spaceSm),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pickDate(isStart: false),
                  icon: const Icon(Icons.calendar_today, size: 16),
                  label: Text(
                    _finishDate != null
                        ? formatMalDate(_finishDate!)
                        : 'Finish Date',
                    style: NovaType.label,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: NovaSize.spaceLg),

          // Save button
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ),
    );
  }
}
