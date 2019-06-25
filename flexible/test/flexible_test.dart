import 'package:flexible/screen_flexible.dart';
import 'package:test/test.dart';

void main() {
  test('默认值测试', () {
    var value = ScreenFlexible.getFinalValue(375.0, 375.0);
    expect(value, 375.0);
  });

  test('指定值测试', () {
    ScreenFlexible.designScreenWidth = 750.0;
    var value = ScreenFlexible.getFinalValue(750.0, 375.0);
    expect(value, 375.0);
  });
}
