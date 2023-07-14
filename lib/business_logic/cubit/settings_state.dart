// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;
  const SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  List<Object?> get props => [
        emailNotifications,
        emailNotifications,
      ];

  @override
  String toString() =>
      'SettingsState(appNotifications: $appNotifications, emailNotifications: $emailNotifications)';
}
