class Config {
  final String? flavorName;
  final String? apiBaseUrl;
  final String? apiSentry;

  // ignore: sort_constructors_first
  Config({
    this.flavorName,
    this.apiBaseUrl,
    this.apiSentry,
  });

  static Config? _instance;

  static Config getInstance({
   dynamic flavorName,
   dynamic apiBaseUrl,
   dynamic apiSentry,
  }) {
    if (_instance == null) {
      _instance = Config(
        flavorName: flavorName,
        apiBaseUrl: apiBaseUrl,
        apiSentry: apiSentry,
      );
      return _instance!;
    }
    return _instance!;
  }
}
