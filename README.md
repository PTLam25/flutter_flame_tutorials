# Flame Tutorial

## Free Assets and music

2d assets: [gameart2d.com](gameart2d), [craftpix.net](craftpix), [gamedevmarket.net](gamedevmarket)
Characters: [https://carlmary.jp/gallery/en/materials-300/](carlmary)

## Screen size

There is property **size** in the FlameGame** class which return size of screen as **Vector2**.

## Sprite

### Load Sprite

1) Instantiate **SpriteComponent** with **onLoad()** method
2) In **onLoad()** method:

- Load sprite
- Add sprite to the game scene
- Set sprite size and position

```dart
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
```


