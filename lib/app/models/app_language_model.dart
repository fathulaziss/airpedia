import 'dart:ui';

class AppLanguageModel {
  AppLanguageModel({
    this.language = 'ID',
    this.locale = const Locale('id', 'ID'),
  });

  factory AppLanguageModel.fromJson(Map<String, dynamic> json) =>
      AppLanguageModel(
        language: json['language'],
        locale: Locale(
          json['locale']['language_code'],
          json['locale']['country_code'],
        ),
      );

  final String language;
  final Locale locale;

  Map<String, dynamic> toJson() => {
        'language': language,
        'locale': locale,
      };
}
