import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/errors/failure.dart';

abstract class ProductRepo {

  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
 
}