import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});
  factory ItemList.fromEntity({required List<CartItemEntity> items}) {
    return ItemList(
      items: items.map((e) => ItemEntity.fromEntity(itemEntity: e)).toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
