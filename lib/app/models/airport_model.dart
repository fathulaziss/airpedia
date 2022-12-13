import 'package:equatable/equatable.dart';

class AirportModel extends Equatable {
  const AirportModel({
    this.code = '',
    this.name = '',
    this.location = '',
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
        code: json['code'],
        name: json['name'],
        location: json['location'],
      );

  final String code;
  final String name;
  final String location;

  @override
  List<Object?> get props => [code, name, location];
}
