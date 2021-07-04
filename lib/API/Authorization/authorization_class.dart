class TokenResponse {
  late String token_type;
  late int    expires_in;
  late String access_token;
  late String refresh_token;

  // ignore: non_constant_identifier_names
  TokenResponse({
    required this.token_type,
    required this.expires_in,
    required this.access_token,
    required this.refresh_token
  });

  TokenResponse.fromJson(Map<String, dynamic> json) {
    token_type = json['token_type'];
    expires_in = json['expires_in'];
    access_token = json['access_token'];
    refresh_token = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = token_type;
    data['expires_in'] = expires_in;
    data['access_token'] = access_token;
    data['refresh_token'] = refresh_token;
    return data;
  }
}
