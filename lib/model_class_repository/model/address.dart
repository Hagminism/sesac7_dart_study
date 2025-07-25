import 'package:json_annotation/json_annotation.dart';

import '/model_class_repository/model/geo.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  // 생성자
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  // copyWith
  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          street == other.street &&
          suite == other.suite &&
          city == other.city &&
          zipcode == other.zipcode &&
          geo == other.geo;

  @override
  int get hashCode =>
      street.hashCode ^
      suite.hashCode ^
      city.hashCode ^
      zipcode.hashCode ^
      geo.hashCode;

  @override
  String toString() {
    return '[street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: ${geo.toString()}]';
  }

  // 역직렬화
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  // 직렬화
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
