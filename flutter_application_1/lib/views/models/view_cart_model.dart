// To parse this JSON data, do
//
//     final viewCartModel = viewCartModelFromJson(jsonString);

import 'dart:convert';

ViewCartModel viewCartModelFromJson(String str) =>
    ViewCartModel.fromJson(json.decode(str));

String viewCartModelToJson(ViewCartModel data) => json.encode(data.toJson());

class ViewCartModel {
  int status;
  Data data;

  ViewCartModel({
    required this.status,
    required this.data,
  });

  factory ViewCartModel.fromJson(Map<String, dynamic> json) => ViewCartModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  List<Fee> fees;
  String orderId;
  String state;
  String totalOrderPrice;
  String totalOrderPriceAfter;
  List<Item> items;
  List<dynamic> coupons;

  Data({
    required this.fees,
    required this.orderId,
    required this.state,
    required this.totalOrderPrice,
    required this.totalOrderPriceAfter,
    required this.items,
    required this.coupons,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fees: List<Fee>.from(json["fees"].map((x) => Fee.fromJson(x))),
        orderId: json["order_id"],
        state: json["state"],
        totalOrderPrice: json["total_order_price"],
        totalOrderPriceAfter: json["total_order_price_after"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "fees": List<dynamic>.from(fees.map((x) => x.toJson())),
        "order_id": orderId,
        "state": state,
        "total_order_price": totalOrderPrice,
        "total_order_price_after": totalOrderPriceAfter,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "coupons": List<dynamic>.from(coupons.map((x) => x)),
      };
}

class Fee {
  String amount;
  String label;

  Fee({
    required this.amount,
    required this.label,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        amount: json["amount"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "label": label,
      };
}

class Item {
  String orderId;
  String orderItemId;
  String title;
  int quantity;
  String unitPrice;
  String totalUnitPrice;
  String image;

  Item({
    required this.orderId,
    required this.orderItemId,
    required this.title,
    required this.quantity,
    required this.unitPrice,
    required this.totalUnitPrice,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        orderId: json["order_id"],
        orderItemId: json["order_item_id"],
        title: json["title"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        totalUnitPrice: json["total_unit_price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_item_id": orderItemId,
        "title": title,
        "quantity": quantity,
        "unit_price": unitPrice,
        "total_unit_price": totalUnitPrice,
        "image": image,
      };
}
