import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';

class GameTwo extends FlameGame with TapDetector, DoubleTapDetector {
  static const String _audioPath = 'game_2';
  static const String _audio1Path = '$_audioPath/track_1.mp3';
  static const String _audio2Path = '$_audioPath/track_2.mp3';

  bool _isMusicPlaying = false;
  int _trackNumber = 1;

  void _pauseMusic() {
    FlameAudio.bgm.pause();
    _isMusicPlaying = false;
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
  }

  @override
  Future<void>? onLoad() {
    FlameAudio.audioCache.loadAll([
      _audio1Path,
      _audio2Path,
    ]);

    FlameAudio.bgm.initialize();

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
