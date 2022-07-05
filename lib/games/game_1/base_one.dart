import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tutorial/games/game_1/components/next_button.dart';
import 'package:flutter/painting.dart';

class GameOne extends FlameGame with HasTappables {
  static const String imagesPath = 'game_1';
  static const double _characterSize = 200.0;
  static const double _nextButtonSize = 50.0;
  static const double _textBoxHeight = 100.0;
  static const double _characterMovementPerFrame = 40.0;

  late final _screenWidth = size[0]; // x coordinate max value
  late final _screenHeight = size[1]; // y coordinate max value

  final SpriteComponent _girlSpite = SpriteComponent();
  final SpriteComponent _boySpite = SpriteComponent();
  final SpriteComponent _background = SpriteComponent();
  final NextButton _nextButton = NextButton();

  bool _isBoyTurnAway = false;
  TextPaint _dialogTextPaint = TextPaint(
    style: const TextStyle(fontSize: 30.0),
  );

  int _dialogLevel = 0;

  void _handleDialogLevel() {
    if ((_girlSpite.x > _characterSize + 50) && _dialogLevel == 0) {
      _dialogLevel = 1;

      return;
    }

    if ((_girlSpite.x > _characterSize + 150) && _dialogLevel == 1) {
      _dialogLevel = 2;

      return;
    }

    if ((_girlSpite.x > _characterSize + 300) && _dialogLevel == 2) {
      _dialogLevel = 3;

      return;
    }

    if (_isBoyTurnAway == true && _dialogLevel == 3) {
      _dialogLevel = 4;

      return;
    }
  }

  void _handleCharacterMovements(double dt) {
    if (_girlSpite.x < _screenWidth / 2 - 100) {
      _girlSpite.x += _characterMovementPerFrame * dt;
    }

    if (_boySpite.x > _screenWidth / 2 - 20) {
      _boySpite.x -= _characterMovementPerFrame * dt;
    } else if (!_isBoyTurnAway && _dialogLevel == 3) {
      _boySpite.flipHorizontally();
      _isBoyTurnAway = true;
    }
  }

  void _renderDialogText(Canvas canvas) {
    switch (_dialogLevel) {
      case 1:
        _dialogTextPaint.render(
          canvas,
          'Anastasiia: Lam, my poop!',
          Vector2(10.0, _screenHeight - _textBoxHeight),
        );
        break;
      case 2:
        _dialogTextPaint.render(
          canvas,
          'Lam: Oh, my ass!',
          Vector2(10.0, _screenHeight - _textBoxHeight),
        );
        break;
      case 3:
        _dialogTextPaint.render(
          canvas,
          'Anastasiia: Give me your poop!',
          Vector2(10.0, _screenHeight - _textBoxHeight),
        );
        break;
      case 4:
        _dialogTextPaint.render(
          canvas,
          'Lam\'s super ass: POOOOOOOOOP!',
          Vector2(10.0, _screenHeight - _textBoxHeight),
        );
        break;
      default:
        break;
    }
  }

  @override
  Future<void>? onLoad() {
    _loadSpites();

    return super.onLoad();
  }

  Future<void> _loadSpites() async {
    _background
      ..sprite = await loadSprite('$imagesPath/background.png')
      ..size = Vector2(_screenWidth, _screenHeight - _textBoxHeight);
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
    super.update(dt);

    _handleCharacterMovements(dt);
    _handleDialogLevel();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    _renderDialogText(canvas);
  }
}
