import 'package:smartify_c_r_m/model/company_model.dart';
import 'package:smartify_c_r_m/model/contact_model.dart';

class Invoice {
  final InvoiceInfo info;
  final CompanyModel company;
  final ContactModel customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.company,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  int? id;
  String? description;
  DateTime? date;
  int? quantity;
  double? vat;
  double? unitPrice;
  double? discount;
  String? userId;

   InvoiceItem({
    this.description,
    this.id,
    this.date,
    this.quantity,
    this.vat,
    this.discount,
    this.unitPrice,
    this.userId
  });

  InvoiceItem.fromMap(Map m) {
    description = m["description"];
    id = m["id"];
    date = m["date"];
    quantity = m["quantity"];
    vat = m["vat"];
    discount = m["discount"];
    unitPrice = m["unitPrice"];
    userId = m["userId"];
  }

Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "date": date,
        "quantity": quantity,
        "vat": vat,
        "discount": discount,
        "unitPrice": unitPrice,
        "userId": userId
      };
}