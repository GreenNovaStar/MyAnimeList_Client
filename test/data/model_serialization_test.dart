import 'package:android_app/data/model/anime_details.dart';
import 'package:android_app/data/model/anime_seasonal.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/manga_details.dart';
import 'package:android_app/data/model/media_list.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/data/model/token.dart';
import 'package:android_app/utils/constants/test_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Data / Node', () {
    test('parses node with snake_case keys', () {
      final data = Data.fromJson({
        'node': {
          'id': 5114,
          'title': 'Fullmetal Alchemist: Brotherhood',
          'main_picture': {'medium': 'https://m.jpg', 'large': 'https://l.jpg'},
          'media_type': 'tv',
          'num_episodes': 64,
          'mean': 9.1,
        },
      });
      expect(data.node.id, 5114);
      expect(data.node.mainPicture?.large, 'https://l.jpg');
      expect(data.node.mediaType, 'tv');
      expect(data.node.numEpisodes, 64);
      expect(data.node.mean, 9.1);
    });

    test('coerces integer mean to double (historical crash)', () {
      final data = Data.fromJson({
        'node': {'id': 1, 'title': 'x', 'mean': 8},
      });
      expect(data.node.mean, 8.0);
    });

    test('parses ranking and list_status siblings', () {
      final data = Data.fromJson({
        'node': {'id': 1, 'title': 'x'},
        'ranking': {'rank': 3, 'previous_rank': 5},
        'list_status': {'status': 'watching', 'num_episodes_watched': 7},
      });
      expect(data.ranking?.rank, 3);
      expect(data.ranking?.previousRank, 5);
      expect(data.listStatus?.status, 'watching');
      expect(data.listStatus?.numEpisodesWatched, 7);
    });

    test('ranking and list_status are optional', () {
      final data = Data.fromJson({
        'node': {'id': 1, 'title': 'x'},
      });
      expect(data.ranking, isNull);
      expect(data.listStatus, isNull);
    });
  });

  group('MediaList / AnimeSeasonal', () {
    test('parses a paginated list', () {
      final list = MediaList.fromJson({
        'data': [
          {
            'node': {'id': 1, 'title': 'a'},
          },
          {
            'node': {'id': 2, 'title': 'b'},
          },
        ],
        'paging': {'next': 'https://next'},
      });
      expect(list.data, hasLength(2));
      expect(list.paging.next, 'https://next');
      expect(list.paging.previous, isNull);
    });

    test('parses the recorded seasonal API response fixture', () {
      final seasonal = AnimeSeasonal.fromJson(seasonalData2017);
      expect(seasonal.season.year, 2017);
      expect(seasonal.season.season, 'summer');
      expect(seasonal.data, isNotEmpty);
      expect(seasonal.data.first.node.title, 'Owarimonogatari 2nd Season');
      expect(seasonal.paging.next, contains('offset=10'));
    });
  });

  group('AnimeDetails', () {
    test('parses detail fields with snake_case keys', () {
      final details = AnimeDetails.fromJson({
        'id': 30230,
        'title': 'Diamond no Ace: Second Season',
        'synopsis': 'Baseball.',
        'mean': 8.3,
        'media_type': 'tv',
        'status': 'finished_airing',
        'num_episodes': 51,
        'average_episode_duration': 1440,
        'start_season': {'year': 2015, 'season': 'spring'},
        'genres': [
          {'id': 30, 'name': 'Sports'},
        ],
        'studios': [
          {'id': 10, 'name': 'Madhouse'},
        ],
        'my_list_status': {'status': 'completed', 'score': 9},
        'opening_themes': [
          {'id': 1, 'anime_id': 30230, 'text': 'OP theme'},
        ],
      });
      expect(details.numEpisodes, 51);
      expect(details.averageEpisodeDuration, 1440);
      expect(details.startSeason?.year, 2015);
      expect(details.genres?.single.name, 'Sports');
      expect(details.studios?.single.name, 'Madhouse');
      expect(details.myListStatus?.score, 9);
      expect(details.openingThemes?.single.text, 'OP theme');
    });

    test('copyWith replaces myListStatus (detail-screen editor flow)', () {
      final details = AnimeDetails.fromJson({'id': 1, 'title': 'x'});
      final updated = details.copyWith(
        myListStatus: const MyListStatus(status: 'watching'),
      );
      expect(details.myListStatus, isNull);
      expect(updated.myListStatus?.status, 'watching');
      expect(updated.id, 1);
    });
  });

  group('MangaDetails serialization converter', () {
    test('flattens serialization node wrappers to names', () {
      final details = MangaDetails.fromJson({
        'id': 2,
        'title': 'Berserk',
        'serialization': [
          {
            'node': {'id': 1, 'name': 'Young Animal'},
          },
        ],
      });
      expect(details.serialization, ['Young Animal']);
    });

    test('round-trips back to the wire shape', () {
      final details = MangaDetails.fromJson({
        'id': 2,
        'title': 'Berserk',
        'serialization': [
          {
            'node': {'name': 'Young Animal'},
          },
        ],
      });
      final json = details.toJson();
      expect(json['serialization'], [
        {
          'node': {'name': 'Young Animal'},
        },
      ]);
    });

    test('handles null and malformed entries', () {
      expect(
        MangaDetails.fromJson({'id': 2, 'title': 'x'}).serialization,
        isNull,
      );
      final details = MangaDetails.fromJson({
        'id': 2,
        'title': 'x',
        'serialization': [
          {'node': null},
          'garbage',
        ],
      });
      expect(details.serialization, isEmpty);
    });
  });

  group('OAuthToken', () {
    test('parses the MAL token response shape', () {
      final token = OAuthToken.fromJson({
        'token_type': 'Bearer',
        'expires_in': 2678400,
        'access_token': 'access',
        'refresh_token': 'refresh',
      });
      expect(token.tokenType, 'Bearer');
      expect(token.expiresIn, 2678400);
      expect(token.expireDate, ''); // locally-computed field defaults to ''
    });

    test('round-trips through JSON (secure-storage persistence)', () {
      const token = OAuthToken(
        tokenType: 'Bearer',
        expiresIn: 100,
        accessToken: 'a',
        refreshToken: 'r',
        expireDate: '2026-08-10 00:00:00.000',
      );
      expect(OAuthToken.fromJson(token.toJson()), token);
    });
  });
}
