part of 'order_model_bloc.dart';

@immutable
sealed class OrderModelEvent {}
final class OrderEvent extends OrderModelEvent{
  final OrderModel orderModel;
  OrderEvent({required this.orderModel });
}