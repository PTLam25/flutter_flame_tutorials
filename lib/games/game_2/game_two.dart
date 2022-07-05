import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/widgets.dart';

class GameTwo extends FlameGame with TapDetector, DoubleTapDetector {
  static const String _audioPath = 'game_2';
  static const String _audio1Path = '$_audioPath/track_1.mp3';
  static const String _audio2Path = '$_audioPath/track_2.mp3';

  bool _isMusicPlaying = false;
  int _trackNumber = 1;

  final TextComponent _instructionsComponent = TextComponent();
  final String _instructionsText = 'play: single tap\n'
      'stop: single tap\n'
      'next song: double tap\n';
  final _textPaint = TextPaint(
    style: TextStyle(color: BasicPalette.white.color),
  );

  void _pauseMusic() {
    FlameAudio.bgm.pause();
    _isMusicPlaying = false;
    _instructionsComponent.text = _instructionsText;
  }

  void _playMusic() {
    late final String audioPath;
    if (_trackNumber == 1) {
      audioPath = _audio1Path;
    } else {
      audioPath = _audio2Path;
    }

    FlameAudio.bgm.play(audioPath);
    _isMusicPlaying = true;
    _instructionsComponent.text = 'playing track $_trackNumber';
  }

  void _addInstructions() {
    _instructionsComponent
      ..text = _instructionsText
      ..textRenderer = _textPaint
      ..x = size[0] / 2
      ..y = size[1] / 2
      ..anchor = Anchor.center;

    add(_instructionsComponent);
  }

  @override
  void onRemove() {
    FlameAudio.audioCache.clearAll();

    super.onRemove();
  }

  @override
  Future<void>? onLoad() {
    FlameAudio.audioCache.loadAll([
      _audio1Path,
      _audio2Path,
    ]);
    FlameAudio.bgm.initialize();
    _addInstructions();

    return super.onLoad();
  }

  @override
  void onDoubleTap() {
    super.onDoubleTap();

    _pauseMusic();

    if (_trackNumber == 1) {
      _trackNumber = 2;
    } else {
      _trackNumber = 1;
    }

    _playMusic();
  }

  @override
  void onTapUp(TapUpInfo info) {
    super.onTapUp(info);

    if (_isMusicPlaying) {
      _pauseMusic();

      return;
    }

    _playMusic();
  }
}
