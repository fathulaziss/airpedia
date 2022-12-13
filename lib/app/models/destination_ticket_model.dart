import 'package:equatable/equatable.dart';

class DestinationTicketModel extends Equatable {
  const DestinationTicketModel({
    this.airportDepartureCode = '',
    this.airportDepartureName = '',
    this.airportDepartureLocation = '',
    this.airportArrivalCode = '',
    this.airportArrivalName = '',
    this.airportArrivalLocation = '',
    this.airlineCode = '',
    this.airlineName = '',
    this.departureSchedule = '',
    this.arrivalSchedule = '',
    this.refundable = false,
    this.insurance = false,
    this.vat = 0,
    this.price = 0,
    this.benefit = const [],
  });

  factory DestinationTicketModel.fromJson(Map<String, dynamic> json) =>
      DestinationTicketModel(
        airportDepartureCode: json['airport_departure_code'],
        airportDepartureName: json['airport_departure_name'],
        airportDepartureLocation: json['airport_departure_location'],
        airportArrivalCode: json['airport_arrival_code'],
        airportArrivalName: json['airport_arrival_name'],
        airportArrivalLocation: json['airport_arrival_location'],
        airlineCode: json['airline_code'],
        airlineName: json['airline_name'],
        departureSchedule: json['departure_schedule'],
        arrivalSchedule: json['arrival_schedule'],
        refundable: json['refundable'],
        insurance: json['insurance'],
        vat: json['vat'],
        price: json['price'],
        benefit: json['benefit'],
      );

  final String airportDepartureCode;
  final String airportDepartureName;
  final String airportDepartureLocation;
  final String airportArrivalCode;
  final String airportArrivalName;
  final String airportArrivalLocation;
  final String airlineCode;
  final String airlineName;
  final String departureSchedule;
  final String arrivalSchedule;
  final bool refundable;
  final bool insurance;
  final double vat;
  final int price;
  final List benefit;

  Map<String, dynamic> toJson() => {
        'airport_departure_code': airportDepartureCode,
        'airport_departure_name': airportDepartureName,
        'airport_departure_location': airportDepartureLocation,
        'airport_arrival_code': airportArrivalCode,
        'airport_arrival_name': airportArrivalName,
        'airport_arrival_location': airportArrivalLocation,
        'airline_code': airlineCode,
        'airline_name': airlineName,
        'departure_schedule': departureSchedule,
        'arrival_schedule': arrivalSchedule,
        'refundable': refundable,
        'insurance': insurance,
        'vat': vat,
        'price': price,
        'benefit': benefit,
      };

  @override
  List<Object?> get props => [
        airportDepartureCode,
        airportDepartureName,
        airportDepartureLocation,
        airportArrivalCode,
        airportArrivalName,
        airportArrivalLocation,
        airlineCode,
        airlineName,
        departureSchedule,
        arrivalSchedule,
        refundable,
        insurance,
        vat,
        price,
        benefit,
      ];
}
