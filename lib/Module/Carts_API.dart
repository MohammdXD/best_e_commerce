import 'package:best_e_commerce/Module/Proudect_API.dart';

class CartsApi {
  int id;
  int quantity;
  final ProudectApi proudect;

  CartsApi({required this.id, required this.quantity, required this.proudect});

  factory CartsApi.fromJson(Map<String, dynamic> json) {
    return CartsApi(
      id: json['id'],
      quantity: json['quantity'],
      proudect: ProudectApi.fromJson(json['proudect']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'quantity': quantity, 'proudect': proudect.toJson()};
  }
}
