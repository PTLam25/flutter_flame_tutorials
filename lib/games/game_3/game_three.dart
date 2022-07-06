import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';

class GameThree extends FlameGame {
  static const String _assetsPath = 'game_3';

  late final SpriteAnimationComponent _boyWalkingSpriteComponent;

  @override
  Future<void>? onLoad() async {
    final boyWalkingSpriteSheet = await fromJSONAtlas(
      '$_assetsPath/boy_sprite_sheet.png',
      'boy_sprite_sheet.json',
    );

    final boyWalkingSpriteAnimation = SpriteAnimation.spriteList(
      boyWalkingSpriteSheet,
      stepTime: 0.2,
    );

    _boyWalkingSpriteComponent = SpriteAnimationComponent(
      animation: boyWalkingSpriteAnimation,
      position: Vector2(0, 0),
      size: Vector2(200, 200),
    );

    add(_boyWalkingSpriteComponent);

    return super.onLoad();
  }
}
