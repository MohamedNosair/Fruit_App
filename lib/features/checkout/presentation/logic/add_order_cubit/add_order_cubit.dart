import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/repo/order/order_repo.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;
  void addOrder(OrderEntity order) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(order);
    result.fold(
      (failure) => emit(AddOrderFailure(message: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
