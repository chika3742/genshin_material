class DataParsingException implements Exception {
  final String assetName;
  final String message;

  DataParsingException({required this.assetName, required this.message});

  @override
  String toString() {
    return "Failed to parse asset \"$assetName\". $message";
  }
}
