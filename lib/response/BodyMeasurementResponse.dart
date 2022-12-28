
import 'package:json_annotation/json_annotation.dart';

part 'BodyMeasurementResponse.g.dart';

@JsonSerializable()
class BodyMeasurementResponse {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'created_at')
  final String created_at;

  @JsonKey(name: 'weight')
  final double weight;

  @JsonKey(name: 'height')
  final double height;

  @JsonKey(name: 'shoulder')
  final double shoulder;

  @JsonKey(name: 'arm')
  final double arm;

  @JsonKey(name: 'chest')
  final double chest;

  @JsonKey(name: 'waist')
  final double waist;

  @JsonKey(name: 'hip')
  final double hip;

  @JsonKey(name: 'tight')
  final double tight;

  @JsonKey(name: 'calf')
  final double calf;

  @JsonKey(name: 'bmi')
  final double bmi;

  BodyMeasurementResponse(
      this.id,
      this.created_at,
      this.weight,
      this.height,
      this.shoulder,
      this.arm,
      this.chest,
      this.waist,
      this.hip,
      this.tight,
      this.calf,
      this.bmi);

  BodyMeasurementResponse.defaultEmpty({
    this.id = -1,
    this.created_at = '',
    this.weight = 0,
    this.height = 0,
    this.shoulder = 0,
    this.arm = 0,
    this.chest = 0,
    this.waist = 0,
    this.hip = 0,
    this.tight = 0,
    this.calf = 0,
    this.bmi = 0,
  });

  //convert json to object
  factory BodyMeasurementResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyMeasurementResponseFromJson(json);

  @override
  String toString() {
    return 'BodyMeasurementResponse{id: $id, created_at: $created_at, weight: $weight, height: $height, shoulder: $shoulder, arm: $arm, chest: $chest, waist: $waist, hip: $hip, tight: $tight, calf: $calf, bmi: $bmi}';
  }
}
