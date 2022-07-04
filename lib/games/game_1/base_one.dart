import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tutorial/games/game_1/components/next_button.dart';

class GameOne extends FlameGame with HasTappables {
  static const String imagesPath = 'game_1';
  static const double _characterSize = 200.0;
  static const double _nextButtonSize = 50.0;
  static const double _textBoxHeight = 100.0;

  late final _screenWidth = size[0]; // x coordinate max value
  late final _screenHeight = size[1]; // y coordinate max value

  final SpriteComponent _girlSpite = SpriteComponent();
  final SpriteComponent _boySpite = SpriteComponent();
  final SpriteComponent _background = SpriteComponent();
  final NextButton _nextButton = NextButton();

  bool _isBoyTurnAway = false;

  @override
  Future<void>? onLoad() {
    _loadSpites();

    return super.onLoad();
  }

  Future<void> _loadSpites() async {
    _background
      ..sprite = await loadSprite('$imagesPath/background.png')
      ..size = size;
    _nextButton
      ..sprite = await loadSprite('$imagesPath/next_button.png')
      ..size = Vector2(_nextButtonSize, _nextButtonSize)
      ..position = Vector2(
        _screenWidth - _nextButtonSize - 10,
        _screenHeight - _nextButtonSize - 10,
      );

    _girlSpite
      ..sprite = await loadSprite('$imagesPath/girl.png')
      ..size = Vector2(_characterSize, _characterSize)
      ..x = _characterSize
      ..y = _screenHeight - _characterSize - _textBoxHeight
      ..anchor = Anchor.topCenter;
    _boySpite
      ..sprite = await loadSprite('$imagesPath/boy.png')
      ..size = Vector2(_characterSize, _characterSize)
      ..y = _screenHeight - _characterSize - _textBoxHeight
      ..x = _screenWidth - _characterSize
      ..anchor = Anchor.topCenter
      ..flipHorizontally();

    add(_background);
    add(_girlSpite);
    add(_boySpite);
    add(_nextButton);
  }

  /// [dt] - how often frame update in in seconds
  @override
  void update(double dt) {
    if (_girlSpite.x < size[0] / 2 - 100) {
      _girlSpite.x += 30 * dt;
    } else if (!_isBoyTurnAway) {
      _boySpite.flipHorizontally();
      _isBoyTurnAway = true;
    }

    if (_boySpite.x > size[0] / 2 - 20) {
      _boySpite.x -= 60 * dt;
    }

    super.update(dt);
  }
}
