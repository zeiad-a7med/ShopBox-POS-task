import 'package:dartz/dartz.dart';

import 'package:shopbox_pos/core/Helpers/Dio/errors.dart';
import 'package:shopbox_pos/features/products/data/products_datasource_local.dart';
import 'package:shopbox_pos/features/products/domain/models/productsResponse/products_response.dart';
import 'package:shopbox_pos/features/products/domain/repository/products_repo_i.dart';

class ProductsRepository implements IProductsRepository {
  ProductsRepository();

  @override
  Future<Either<ServerException, ProductsResponse>> getAllProducts({
    int? limit,
    int? skip,
  }) async {
    final IProductsRemoteDataSource productsRemoteDataSource =
        ProductsRemoteDataSource();
    return await productsRemoteDataSource.getAllProducts(
      limit: limit,
      skip: skip,
    );
  }
}
