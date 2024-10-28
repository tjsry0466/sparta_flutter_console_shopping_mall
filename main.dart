import 'dart:io';

import 'class/product.class.dart';
import 'class/shopping-mall.class.dart';

ShoppingMall getInitializedShoppingMall() {
  Product shirt = Product(name: '셔츠', price: 45000);
  Product onepiece = Product(name: '원피스', price: 30000);
  Product tShirt = Product(name: '티셔츠', price: 35000);
  Product shorts = Product(name: '반바지', price: 38000);
  Product socks = Product(name: '양말', price: 5000);

  ShoppingMall shoppingMall =
      ShoppingMall(products: [shirt, onepiece, tShirt, shorts, socks]);
  return shoppingMall;
}

void main() {
  ShoppingMall shoppingMall = getInitializedShoppingMall();

  while (true) {
    print(
        '------------------------------------------------------------------------------------------------------');
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print(
        '------------------------------------------------------------------------------------------------------');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        shoppingMall.showProducts();
        break;

      case '2':
        shoppingMall.addToCart();
        break;

      case '3':
        shoppingMall.showTotalPrice();
        break;

      case '4':
        final isTermiate = shoppingMall.checkTerminate();
        if (isTermiate) {
          print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
          exit(0);
        }

      case '6':
        shoppingMall.resetShoppingCart();
        break;

      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
