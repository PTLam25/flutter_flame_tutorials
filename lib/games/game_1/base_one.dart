import 'package:flame/components.dart';
import 'package:flame/game.dart';

class GameOne extends FlameGame {
  final SpriteComponent _girlSpite = SpriteComponent();
  final SpriteComponent _boySpite = SpriteComponent();

  @override
  Future<void>? onLoad() {
    _loadSpites();

    return super.onLoad();
  }

  Future<void> _loadSpites() async {
    _girlSpite
      ..sprite = await loadSprite('girl.png')
      ..size = Vector2(300, 300)
      ..y = 100;
    _boySpite
      ..sprite = await loadSprite('boy.png')
      ..size = Vector2(300, 300)
      ..y = 100;

    add(_girlSpite);
    add(_boySpite);
  }
}
