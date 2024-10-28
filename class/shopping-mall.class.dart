import 'dart:io';

import '../util/format-currency.dart';
import 'product.class.dart';

class ShoppingMall {
  late List<Product> products;
  Set<String> shoppingCartProductNames = Set();
  int totalCartPrice = 0;

  ShoppingMall({required List<Product> products}) {
    this.products = products;
  }

  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart() {
    print("상품 이름을 입력해주세요!");
    String? productName = stdin.readLineSync();

    print("상품 개수를 입력해주세요!");
    int? amount;
    try {
      String? amountString = stdin.readLineSync();
      amount = int.parse(amountString!);
    } catch (error) {}

    final includeProduct =
        products.map((item) => item.name).contains(productName);

    if (!includeProduct || amount == null) {
      print('입력값이 올바르지 않아요!');
      return;
    } else if (amount < 1) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요!');
      return;
    }

    if (!shoppingCartProductNames.contains(productName)) {
      shoppingCartProductNames.add(productName!);
    }

    final product = products.singleWhere((item) => item.name == productName);
    totalCartPrice += product.price * amount;

    print('장바구니에 상품이 담겼어요 !');
  }

  void showTotalPrice() {
    if (shoppingCartProductNames.length < 1) {
      print('장바구니에 담긴 상품이 없습니다.');
      return;
    }

    print(
        '장바구니에 ${shoppingCartProductNames.join(", ")}가 담겨있네요. 총 ${formatCurrency(totalCartPrice)}원 입니다!');
  }

  void resetShoppingCart() {
    if (shoppingCartProductNames.length < 1) {
      print("이미 장바구니가 비어있습니다.");
      return;
    }

    print('장바구니를 초기화합니다.');
  }

  bool checkTerminate() {
    print("정말 종료하시겠습니까?");

    String? input = stdin.readLineSync();
    if (input != '5') {
      print("종료하지 않습니다.");
      return false;
    }

    return true;
  }
}
