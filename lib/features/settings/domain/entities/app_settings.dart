class AppSettings {
  const AppSettings({
    required this.useMockApi,
    required this.enableBiometrics,
  });

  final bool useMockApi;
  final bool enableBiometrics;

  AppSettings copyWith({
    bool? useMockApi,
    bool? enableBiometrics,
  }) {
    return AppSettings(
      useMockApi: useMockApi ?? this.useMockApi,
      enableBiometrics: enableBiometrics ?? this.enableBiometrics,
    );
  }
}
