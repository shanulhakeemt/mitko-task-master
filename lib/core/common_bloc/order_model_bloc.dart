import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mitco_task/features/model_class/order_model_class.dart';

part 'order_model_event.dart';

class OrderModelBloc extends Bloc<OrderModelEvent,OrderModel?> {
  OrderModelBloc() : super(null) {
    on<OrderEvent>((event, emit) {
      // TODO: implement event handler
      emit(event.orderModel);
    });
  }
}
