import '../../domain/entities/language/LanguageEntity.dart';

///define language items for support localization(l10n)
class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English',assets: 'assets/img/EN.png'),
    LanguageEntity(code: 'id', value: 'Indonesia',assets: 'assets/img/ID.png'),
  ];
}
