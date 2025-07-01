import 'package:dartz/dartz.dart';

import 'package:shopbox_pos/core/Helpers/Dio/dio_helper.dart';
import 'package:shopbox_pos/core/Helpers/Dio/errors.dart';
import 'package:shopbox_pos/core/constants/api_endpoints.dart';
import 'package:shopbox_pos/features/products/domain/models/productsResponse/products_response.dart';
import 'package:shopbox_pos/features/products/domain/repository/products_repo_i.dart';

class ProductsRepository implements IProductsRepository {
  ProductsRepository();

  @override
  Future<Either<ServerException, ProductsResponse>> getAllProducts({
    int? limit,
    int? skip,
  }) async {
    try {
      final response = await DioHelper.get(
        ApiEndPoints.products,
        query: {'limit': limit, 'skip': skip},
      );
      if (response.statusCode == 200) {
        if (response.data["products"] != null) {
          var result = ProductsResponse.fromJson(response.data);
          return Right(result);
        } else {
          return Left(
            ServerException(
              response.data["message"] ?? "failed to get products",
            ),
          );
        }
      } else {
        return Left(ServerException("Error: ${response.statusCode}"));
      }
    } catch (e) {
      return Left(ServerException("Network error: $e"));
    }
  }
}
