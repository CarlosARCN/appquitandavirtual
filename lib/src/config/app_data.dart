// ignore_for_file: non_constant_identifier_names

import 'package:appquitanda/src/models/Iten_model.dart';
import 'package:appquitanda/src/models/cart_item_model.dart';

//itens menu
ItemModel apple = ItemModel(
  description:
      'a melhor appappleappleappleappleappleappleappleappleappleappleappleappleappleappleappleappleappleappleappleappleapplejdgfoashdglasjhlkgscasidcosahvdlcjhgsdjcvLJHRLJSHVCLHbascarloasdcarlosdcarloaslkanldfnaiovdncosvdasglinda;ofjvadlskdfjslkriowisnrovsnlfg;kdfkodbgodknfldsvk sle le le el el el el ele le le l el le le le el el el el el el el le le e ninja nina njiandjs aniknfiajndfianij nijnaijnfiajnfiajndfijnqnaijsnaijesporte  oaksfnajdfskjdnksjnogdsnocarro onsfoanfonaofndinheiro le',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maça',
  price: 5.5,
  unit: 'kg',
);
ItemModel grape = ItemModel(
  description: 'a melhor uva',
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'uva',
  price: 5.5,
  unit: 'kg',
);
ItemModel banana = ItemModel(
  description: 'a melhor banana',
  imgUrl: 'assets/fruits/banana.jpeg',
  itemName: 'Banana',
  price: 5.5,
  unit: 'pc',
);
ItemModel pineapple = ItemModel(
  description: 'o melhor abacaxi',
  imgUrl: 'assets/fruits/pineapple.png',
  itemName: 'abacaxi',
  price: 5.5,
  unit: 'pc',
);

List<ItemModel> items = [
  apple,
  grape,
  banana,
  pineapple,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> CartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: grape, quantity: 1),
  CartItemModel(item: banana, quantity: 9),
];
