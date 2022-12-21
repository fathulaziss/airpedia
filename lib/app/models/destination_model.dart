import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  const DestinationModel({
    this.about = '',
    this.airportDestinationCode = '',
    this.airportDestinationLocation = '',
    this.airportDestinationName = '',
    this.country = '',
    this.destinationName = '',
    this.image = '',
    this.interests = const [],
    this.photos = const [],
    this.rating = 0,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
        about: json['about'],
        airportDestinationCode: json['airport_destination_code'],
        airportDestinationLocation: json['airport_destination_location'],
        airportDestinationName: json['airport_destination_name'],
        country: json['country'],
        destinationName: json['destination_name'],
        image: json['image'],
        interests: json['interests'],
        photos: json['photos'],
        rating: json['rating'],
      );

  final String about;
  final String airportDestinationCode;
  final String airportDestinationLocation;
  final String airportDestinationName;
  final String country;
  final String destinationName;
  final String image;
  final List interests;
  final List photos;
  final double rating;

  Map<String, dynamic> toJson() => {
        'about': about,
        'airport_destination_code': airportDestinationCode,
        'airport_destination_location': airportDestinationLocation,
        'airport_destination_name': airportDestinationName,
        'country': country,
        'destination_name': destinationName,
        'image': image,
        'interests': interests,
        'photos': photos,
        'rating': rating,
      };

  @override
  List<Object?> get props => [
        about,
        airportDestinationCode,
        airportDestinationLocation,
        airportDestinationName,
        country,
        destinationName,
        image,
        interests,
        photos,
        rating,
      ];
}
