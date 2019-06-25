import 'package:flexible/screen_flexible.dart';
import 'package:test/test.dart';

void main() {
  test('adds one to input values', () {
    var value = ScreenFlexible.getFinalValue(375.0, 375.0);
    expect(value, 375.0);

    ScreenFlexible.designScreenWidth = 750.0;
    var value2 = ScreenFlexible.getFinalValue(750.0, 375.0);
    expect(value2, 375.0);
  });
}
