part of 'auth_screen_bloc.dart';

@immutable
sealed class AuthScreenEvent {}

final class AuthSignIn extends AuthScreenEvent {
  // final BuildContext context;
  final String email;
  final String password;
  AuthSignIn({required this.email, required this.password});
}
