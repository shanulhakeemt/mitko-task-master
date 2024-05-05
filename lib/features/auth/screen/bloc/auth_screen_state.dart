part of 'auth_screen_bloc.dart';

@immutable
sealed class AuthScreenState {}

final class AuthScreenInitial extends AuthScreenState {

}
final class AuthSuccess extends AuthScreenState{
  final OrderModel orderModel;
  AuthSuccess({required this.orderModel});
}
final class AuthFailure extends AuthScreenState{
  final String message;
  AuthFailure({required this.message});
}
final class AuthLoading extends AuthScreenState{}