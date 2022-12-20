import 'package:equatable/equatable.dart';

class HistoryModel extends Equatable {
  const HistoryModel({
    required this.transactionType,
    required this.title,
    required this.amount,
    required this.transactionDate,
    required this.userId,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        transactionType: json['transaction_type'],
        title: json['title'],
        amount: json['amount'],
        transactionDate:
            DateTime.fromMillisecondsSinceEpoch(json['transaction_date']),
        userId: json['user_id'],
      );

  final String transactionType;
  final String title;
  final int amount;
  final DateTime transactionDate;
  final String userId;

  @override
  List<Object?> get props => [
        transactionType,
        title,
        amount,
        transactionDate,
        userId,
      ];
}
