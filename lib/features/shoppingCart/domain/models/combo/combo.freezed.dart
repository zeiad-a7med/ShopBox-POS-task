// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Combo {

 List<CartItem> get comboItems; String get category;
/// Create a copy of Combo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComboCopyWith<Combo> get copyWith => _$ComboCopyWithImpl<Combo>(this as Combo, _$identity);

  /// Serializes this Combo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Combo&&const DeepCollectionEquality().equals(other.comboItems, comboItems)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(comboItems),category);

@override
String toString() {
  return 'Combo(comboItems: $comboItems, category: $category)';
}


}

/// @nodoc
abstract mixin class $ComboCopyWith<$Res>  {
  factory $ComboCopyWith(Combo value, $Res Function(Combo) _then) = _$ComboCopyWithImpl;
@useResult
$Res call({
 List<CartItem> comboItems, String category
});




}
/// @nodoc
class _$ComboCopyWithImpl<$Res>
    implements $ComboCopyWith<$Res> {
  _$ComboCopyWithImpl(this._self, this._then);

  final Combo _self;
  final $Res Function(Combo) _then;

/// Create a copy of Combo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comboItems = null,Object? category = null,}) {
  return _then(_self.copyWith(
comboItems: null == comboItems ? _self.comboItems : comboItems // ignore: cast_nullable_to_non_nullable
as List<CartItem>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Combo extends Combo {
  const _Combo({final  List<CartItem> comboItems = const [], required this.category}): _comboItems = comboItems,super._();
  factory _Combo.fromJson(Map<String, dynamic> json) => _$ComboFromJson(json);

 final  List<CartItem> _comboItems;
@override@JsonKey() List<CartItem> get comboItems {
  if (_comboItems is EqualUnmodifiableListView) return _comboItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comboItems);
}

@override final  String category;

/// Create a copy of Combo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComboCopyWith<_Combo> get copyWith => __$ComboCopyWithImpl<_Combo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComboToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Combo&&const DeepCollectionEquality().equals(other._comboItems, _comboItems)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comboItems),category);

@override
String toString() {
  return 'Combo(comboItems: $comboItems, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ComboCopyWith<$Res> implements $ComboCopyWith<$Res> {
  factory _$ComboCopyWith(_Combo value, $Res Function(_Combo) _then) = __$ComboCopyWithImpl;
@override @useResult
$Res call({
 List<CartItem> comboItems, String category
});




}
/// @nodoc
class __$ComboCopyWithImpl<$Res>
    implements _$ComboCopyWith<$Res> {
  __$ComboCopyWithImpl(this._self, this._then);

  final _Combo _self;
  final $Res Function(_Combo) _then;

/// Create a copy of Combo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comboItems = null,Object? category = null,}) {
  return _then(_Combo(
comboItems: null == comboItems ? _self._comboItems : comboItems // ignore: cast_nullable_to_non_nullable
as List<CartItem>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
