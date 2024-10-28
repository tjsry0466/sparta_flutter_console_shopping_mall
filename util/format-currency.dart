/**
 * 숫자를 세 자리마다 쉼표로 구분하여 문자열로 변환
 */
String formatCurrency(int number) {
  return number.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},',
      );
}
