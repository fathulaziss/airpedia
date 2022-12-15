import 'package:equatable/equatable.dart';

class SeatModel extends Equatable {
  const SeatModel({
    this.isAvailable = false,
    this.name = '',
  });

  factory SeatModel.fromJson(Map<String, dynamic> json) => SeatModel(
        isAvailable: json['is_available'],
        name: json['name'],
      );

  final bool isAvailable;
  final String name;

  @override
  List<Object?> get props => [isAvailable, name];
}
