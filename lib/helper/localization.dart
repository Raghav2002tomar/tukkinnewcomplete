class Localization {
  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      'app_name': 'Tukki',
      'app_description': 'Manage your properties with ease and get instant alert about responses',
    },
    'fr': {
      'app_name': 'Tukki_fr',
      'app_description': 'Gérez vos propriétés avec facilité et recevez une alerte instantanée sur les réponses',
    },
  };
  static String get(String key, String languageCode) {
    return localizedValues[languageCode]?[key] ?? '';
  }
}
class ImageLocalization {
  static Map<String, Map<String, String>> localizedImages = {
    'en': {
      'app_logo': 'assets/images/mainapplogo.png',
      'splash_image': 'assets/images/spleshhouseimage.png',
    },
  };
  
  static String getImage(String key, String languageCode) {
    return localizedImages[languageCode]?[key] ?? '';
  }
}