import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/app/models/destination_ticket_model.dart';
import 'package:equatable/equatable.dart';

class TicketModel extends Equatable {
  const TicketModel({
    this.destination = const DestinationModel(),
    this.ticket = const DestinationTicketModel(),
    this.departureSchedule = 0,
    this.transactionDate = 0,
    this.totalPassenger = 0,
    this.selectedSeat = '',
    this.total = 0,
    this.refNumber = '',
    this.userId = '',
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        destination: DestinationModel.fromJson(json['destination']),
        ticket: DestinationTicketModel.fromJson(json['ticket']),
        departureSchedule: json['departure_schedule'],
        transactionDate: json['transaction_date'],
        totalPassenger: json['total_passenger'],
        selectedSeat: json['selected_seat'],
        total: json['total'],
        refNumber: json['ref_number'],
        userId: json['user_id'],
      );

  final DestinationModel destination;
  final DestinationTicketModel ticket;
  final int departureSchedule;
  final int transactionDate;
  final int totalPassenger;
  final String selectedSeat;
  final int total;
  final String refNumber;
  final String userId;

  @override
  List<Object?> get props => [
        destination,
        ticket,
        departureSchedule,
        transactionDate,
        totalPassenger,
        selectedSeat,
        total,
        refNumber,
      ];
}
