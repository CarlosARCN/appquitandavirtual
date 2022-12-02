import 'package:json_annotation/json_annotation.dart';

import 'package:appquitanda/src/models/cart_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id;
  DateTime? createdDatetime;

  @JsonKey(name: 'due')
  DateTime overdueDatetime;

  @JsonKey(defaultValue: [])
  List<CartItemModel> items;
  String status;

  String qrCodeImage;

  @JsonKey(name: 'copiaecola')
  String copyAndPaste;
  double total;
  OrderModel({
    required this.id,
    this.createdDatetime,
    required this.overdueDatetime,
    required this.items,
    required this.status,
    required this.qrCodeImage,
    required this.copyAndPaste,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  String toString() {
    return 'OrderModel(id: $id, createdDatetime: $createdDatetime, overdueDatetime: $overdueDatetime, items: $items, status: $status, qrCodeImage: $qrCodeImage, copyAndPaste: $copyAndPaste, total: $total)';
  }
}
