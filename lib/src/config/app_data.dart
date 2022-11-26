import 'package:appquitanda/src/models/Iten_model.dart';
import 'package:appquitanda/src/models/user_model.dart';
import 'package:appquitanda/src/models/cart_item_model.dart';
import 'package:appquitanda/src/models/order_model.dart';

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

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: grape, quantity: 1),
  CartItemModel(item: banana, quantity: 9),
];

UserModel user = UserModel(
    cpf: '999.999.999-00',
    password: 'Sen888888ha',
    phone: '+12 345 567890123',
    email: 'emailcomum@indiferente.igual',
    name: 'nulidade');

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDatetime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDatetime: DateTime.parse(
      '2023-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: banana,
        quantity: 2,
      ),
    ],
  ),

  // Pedido 02
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDatetime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDatetime: DateTime.parse(
      '2023-06-08 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartItemModel(
        item: apple,
        quantity: 1,
      ),
    ],
  ),
];
