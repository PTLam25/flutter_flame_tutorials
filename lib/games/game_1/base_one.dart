import 'package:flame/components.dart';
import 'package:flame/game.dart';

class GameOne extends FlameGame {
  static const String imagesPath = 'game_1';
  static const double _characterSize = 200.0;
  static const double _textBoxHeight = 100.0;

  late final _screenWidth = size[0]; // x coordinate max value
  late final _screenHeight = size[1]; // y coordinate max value

  final SpriteComponent _girlSpite = SpriteComponent();
  final SpriteComponent _boySpite = SpriteComponent();
  final SpriteComponent _background = SpriteComponent();

  @override
  Future<void>? onLoad() {
    _loadSpites();

    return super.onLoad();
  }

  Future<void> _loadSpites() async {
    _background
      ..sprite = await loadSprite('$imagesPath/background.png')
      ..size = size;
    _girlSpite
      ..sprite = await loadSprite('$imagesPath/girl.png')
      ..size = Vector2(_characterSize, _characterSize)
      ..y = _screenHeight - _characterSize - _textBoxHeight;
    _boySpite
      ..sprite = await loadSprite('$imagesPath/boy.png')
      ..size = Vector2(_characterSize, _characterSize)
      ..y = _screenHeight - _characterSize - _textBoxHeight
      ..x = _screenWidth - _characterSize;

    add(_background);
    add(_girlSpite);
    add(_boySpite);
  }
}
