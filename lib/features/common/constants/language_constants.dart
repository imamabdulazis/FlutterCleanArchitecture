import '../../domain/entities/app/language_entity.dart';

///define language items for support localization(l10n)
class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English',assets: 'assets/img/US.png'),
    LanguageEntity(code: 'id', value: 'Indonesia',assets: 'assets/img/ID.png'),
  ];
}
