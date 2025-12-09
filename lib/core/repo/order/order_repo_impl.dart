import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/repo/order/order_repo.dart';
import 'package:fruit_app/core/supabase/database_service.dart';
import 'package:fruit_app/core/utils/backend_end_points.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/model/order_model.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    try {
      await databaseService.addData(
        data: OrderModel.fromEntity(orderEntity).toJson(),
        path: BackendEndPoints.addOrder,
        documentId: orderEntity.uID,
      );
      return const Right('');
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
