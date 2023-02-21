
import 'package:smartify_c_r_m/model/company_model.dart';

import 'contact_model.dart';

class Invoice {
   int? id;
   String? name;
   String? userId;
   int? customerId;
   int? termId;
   String? description;
   String? number;
   String? status;
   DateTime? date;
   DateTime? dueDate;
   CompanyModel? company;
   ContactModel? customer;
   InvoiceInfo? info;
   List<InvoiceItem>? items;

   Invoice({
    this.id,
    this.name,
    this.userId,
    this.customerId,
    this.termId,
    this.description,
    this.number,
    this.date,
    this.dueDate,
    this.company,
    this.customer,
    this.info,
    this.items,
    this.status
  });


  Invoice.fromMap(Map m) {
    description = m["description"];
    id = m["id"];
    name = m["name"];
    userId = m["userId"];
    customerId = m["customerId"];
    termId = m["termId"];
    number = m["number"];
    date = m["date"];
    dueDate = m["dueDate"];
    status = m["status"];
  }

Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "date": date,
        "dueDate": dueDate,
        "userId": userId,
        "customerId": customerId,
        "termId": termId,
        "number": number,
        "name": name,
        "status": status,
      };

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
  int? invoiceId;

   InvoiceItem({
    this.description,
    this.id,
    this.date,
    this.quantity,
    this.vat,
    this.discount,
    this.unitPrice,
    this.userId,
    this.invoiceId
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
    invoiceId = m["invoiceId"];
  }

Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "date": date,
        "quantity": quantity,
        "vat": vat,
        "discount": discount,
        "unitPrice": unitPrice,
        "userId": userId,
        "invoiceId": invoiceId,
      };
}

enum InvoiceStatus {
  draft,
  fullyPaid,
  partiallyPaid,
  overdue
}