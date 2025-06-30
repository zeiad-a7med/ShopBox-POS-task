import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopbox_pos/Helpers/Dio/errors.dart';
import 'package:shopbox_pos/features/products/domain/models/productsResponse/products_response.dart';
import 'package:shopbox_pos/features/products/domain/repository/products_repo.dart';
part 'products_repo_i.g.dart';

@riverpod
IProductsRepository productsRepository(Ref ref) {
  return ProductsRepository();
}

abstract class IProductsRepository {
  Future<Either<ServerException, ProductsResponse>> getAllProducts({
    int? limit,
    int? skip
  });
}
