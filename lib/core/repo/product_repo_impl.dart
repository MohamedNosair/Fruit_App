import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/firebase/database_service.dart';
import 'package:fruit_app/core/model/product_model.dart';
import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:fruit_app/core/utils/backend_end_points.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndPoints.getAllProducts,
                query: {
                  'limit': 10,
                  'orderBy': '',
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> result = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(result);
    } catch (e) {
      return left(ServerFailure(message: 'failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
}
