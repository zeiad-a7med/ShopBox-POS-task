// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    _ProductsResponse(
      total: (json['total'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseToJson(_ProductsResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
      'products': instance.products,
    };
