class RealtimeDatabaseOptions {
  RealtimeDatabaseOptions({
    this.serverBaseUrl,
    this.useSsl,
    this.apiKey,
    this.apiSecret
  });

  final String serverBaseUrl;
  final bool useSsl;
  final String apiKey;
  final String apiSecret;
}
