import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class InfoGoogleModel {
  final String accessToken;
      final String idToken;
      final String userName;
      final String userEmail;
      final String userAvatarUrl;
  InfoGoogleModel({
    required this.accessToken,
    required this.idToken,
    required this.userName,
    required this.userEmail,
    required this.userAvatarUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'idToken': idToken,
      'userName': userName,
      'userEmail': userEmail,
      'userAvatarUrl': userAvatarUrl,
    };
  }

  factory InfoGoogleModel.fromMap(Map<String, dynamic> map) {
    return InfoGoogleModel(
      accessToken: map['accessToken'] as String,
      idToken: map['idToken'] as String,
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
      userAvatarUrl: map['userAvatarUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoGoogleModel.fromJson(String source) => InfoGoogleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
