// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  category: json['category'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  stock: (json['stock'] as num?)?.toInt(),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  brand: json['brand'] as String?,
  availabilityStatus: json['availabilityStatus'] as String?,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  thumbnail: json['thumbnail'] as String?,
  cartQuantity: (json['cartQuantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'price': instance.price,
  'discountPercentage': instance.discountPercentage,
  'rating': instance.rating,
  'stock': instance.stock,
  'tags': instance.tags,
  'brand': instance.brand,
  'availabilityStatus': instance.availabilityStatus,
  'images': instance.images,
  'thumbnail': instance.thumbnail,
  'cartQuantity': instance.cartQuantity,
};
