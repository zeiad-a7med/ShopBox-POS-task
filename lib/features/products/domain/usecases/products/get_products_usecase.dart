import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopbox_pos/core/Helpers/Dio/errors.dart';
import 'package:shopbox_pos/features/products/domain/models/productsResponse/products_response.dart';
import 'package:shopbox_pos/features/products/domain/repository/products_repo_i.dart';

part 'get_products_usecase.g.dart';

@riverpod
Future<Either<ServerException, ProductsResponse>> getProductsUseCase(
  Ref ref, {
  int? limit,
  int? skip,
}) async {
  return await ref
      .read(productsRepositoryProvider)
      .getAllProducts(limit: limit, skip: skip);
}
