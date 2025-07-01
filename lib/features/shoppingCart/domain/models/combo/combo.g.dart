// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Combo _$ComboFromJson(Map<String, dynamic> json) => _Combo(
  comboItems:
      (json['comboItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  category: json['category'] as String,
);

Map<String, dynamic> _$ComboToJson(_Combo instance) => <String, dynamic>{
  'comboItems': instance.comboItems,
  'category': instance.category,
};
