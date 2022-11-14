// ignore_for_file: file_names, library_prefixes, non_constant_identifier_names

import 'dart:ffi';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:appquitanda/src/pages/home/components/item_tile.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:appquitanda/src/config/app_data.dart' as appData1;
import '../../config/custom_colors.dart';
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais',
  ];

  String selectedCategory = 'Frutas';

  GlobalKey<CartIconKey> globalKeyCartItem = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  Void itemSelectedCartAnimations(GlobalKey gkImage) {
    return runAddToCardAnimation(gkImage);
  }

  utilServices utilservices = utilServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 40,
            ),
            children: [
              const TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItem,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalKeyCartItem,
        previewDuration: const Duration(milliseconds: 50),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCArdAnimationMethod) {
          runAddToCardAnimation = addToCArdAnimationMethod;
        },
        child: Column(
          children: [
            //pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquisa',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                ),
              ),
            ),
            //categorias
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = appData1.categories[index];
                      });
                    },
                    category: appData1.categories[index],
                    isSelected: appData1.categories[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: appData1.categories.length,
              ),
            ),
            //grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: appData1.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: appData1.items[index],
                    cartAnimationMethod: itemSelectedCartAnimations,
                    //item: appData1.items
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
