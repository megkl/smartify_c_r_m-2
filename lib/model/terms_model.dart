import 'package:smartify_c_r_m/model/company_model.dart';
import 'package:smartify_c_r_m/model/contact_model.dart';


class Terms {
  int? id;
 String? description;
  String? userId;

   Terms({
    this.description,
    this.id,
    this.userId
  });

  Terms.fromMap(Map m) {
    description = m["description"];
    id = m["id"];
    userId = m["userId"];
  }

Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "userId": userId
      };
}