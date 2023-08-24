enum LocalesModel {
  ar(languageCode: 'ar', scriptCode: null, label: 'عربي', flag: '🇸🇦'),
  de(languageCode: 'de', scriptCode: null, label: 'Deutsch', flag: '🇩🇪'),
  en(languageCode: 'en', scriptCode: null, label: 'English', flag: '🇺🇸'),
  es(languageCode: 'es', scriptCode: null, label: 'Español', flag: '🇪🇸'),
  fr(languageCode: 'fr', scriptCode: null, label: 'Français', flag: '🇫🇷'),
  it(languageCode: 'it', scriptCode: null, label: 'Italiano', flag: '🇮🇹'),
  ja(languageCode: 'ja', scriptCode: null, label: '日本語', flag: '🇯🇵'),
  ko(languageCode: 'ko', scriptCode: null, label: '한국인', flag: '🇰🇷'),
  ru(languageCode: 'ru', scriptCode: null, label: 'Русский', flag: '🇷🇺'),
  zhHans(languageCode: 'zh', scriptCode: 'Hans', label: '简体中文', flag: '🇨🇳'),
  zhHant(languageCode: 'zh', scriptCode: 'Hant', label: '正體中文', flag: '🇨🇳');

  final String languageCode;
  final String? scriptCode;
  final String label;
  final String flag;
  const LocalesModel({
    required this.languageCode,
    required this.scriptCode,
    required this.label,
    required this.flag,
  });
}
