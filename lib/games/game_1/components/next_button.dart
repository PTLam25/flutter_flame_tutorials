import 'package:flame/components.dart';
import 'package:flame/input.dart';

class NextButton extends SpriteComponent with Tappable {
  @override
  bool onTapDown(TapDownInfo info) {
    try {
      return true;
    } catch (error) {
      return false;
    }
  }
}
