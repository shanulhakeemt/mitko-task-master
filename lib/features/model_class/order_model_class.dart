import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{
  final String email;
  final String password;
  final String accountHolderName;
  final String ifscCode;
  final String orderId;
  final String status;
  final String total;
  final String trade;
  final String transferRate;
  final DateTime date;
   final DocumentReference ?reference;

//<editor-fold desc="Data Methods">
  const OrderModel({
    required this.email,
    required this.password,
    this.reference,
    required this.accountHolderName,
    required this.ifscCode,
    required this.orderId,
    required this.status,
    required this.total,
    required this.trade,
    required this.transferRate,
    required this.date,
  });


  OrderModel copyWith({
    String? email,
    String? password,
    String? accountHolderName,
    String? ifscCode,
    String? orderId,
    String? status,
    DocumentReference ?reference,
    String? total,
    String? trade,
    String? transferRate,
    DateTime? date,
  }) {
    return OrderModel(
      email: email ?? this.email,
      reference: reference??this.reference,
      password: password ?? this.password,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      ifscCode: ifscCode ?? this.ifscCode,
      orderId: orderId ?? this.orderId,
      status: status ?? this.status,
      total: total ?? this.total,
      trade: trade ?? this.trade,
      transferRate: transferRate ?? this.transferRate,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'password': this.password,
      'reference':this.reference,
      'accountHolderName': this.accountHolderName,
      'ifscCode': this.ifscCode,
      'orderId': this.orderId,
      'status': this.status,
      'total': this.total,
      'trade': this.trade,
      'transferRate': this.transferRate,
      'date': this.date,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      email: map['email'] ??'',
      password: map['password']??'',
      reference: map['reference'],
      accountHolderName: map['accountHolderName'] ??'',
      ifscCode: map['ifscCode']??'',
      orderId: map['orderId']??'',
      status: map['status'] ??'',
      total: map['total']??'',
      trade: map['trade'] ??'',
      transferRate: map['transferRate'] ??'',
      date: map['date']==null?DateTime.now():map['date'].toDate(),
    );
  }

//</editor-fold>
}