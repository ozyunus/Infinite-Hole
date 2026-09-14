import 'dart:math';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'falling_object.dart';
import 'hole.dart';

class InfiniteHoleGame extends FlameGame {
  late Hole hole;

  final Random _random = Random();

  final ValueNotifier<int> possibleNotifier = ValueNotifier(0);
  final ValueNotifier<int> caughtNotifier = ValueNotifier(0);
  final ValueNotifier<int> levelNotifier = ValueNotifier(1);

  final Set<FallingObject> _handledObjects = {};

  double _spawnTimer = 0;
  double _nextSpawnTime = 2.5;

  int get level => levelNotifier.value;

  double get objectSpeed {
    return 110 + ((level - 1) * 20);
  }

  @override
  Color backgroundColor() => const Color(0xFF000000);

  @override
  Future<void> onLoad() async {
    hole = Hole(position: Vector2(size.x / 2, size.y - 100));

    add(hole);

    _spawnObject();
  }

  @override
  void update(double dt) {
    super.update(dt);

    _spawnTimer += dt;

    if (_spawnTimer >= _nextSpawnTime) {
      _spawnTimer = 0;
      _nextSpawnTime = 2.0 + _random.nextDouble();

      _spawnObject();
    }

    _checkCollisions();
    _checkMissedObjects();
  }

  void _spawnObject() {
    final shapes = FallingShape.values;
    final shape = shapes[_random.nextInt(shapes.length)];

    final sizeRoll = _random.nextDouble();

    double radius;

    if (sizeRoll < 0.40) {
      radius = 15 + _random.nextDouble() * 15;
    } else if (sizeRoll < 0.75) {
      radius = 30 + _random.nextDouble() * 15;
    } else {
      radius = 50 + _random.nextDouble() * 35;
    }

    final object = FallingObject(
      position: Vector2(
        radius + _random.nextDouble() * (size.x - radius * 2),
        -radius,
      ),
      radius: radius,
      speed: objectSpeed,
      shape: shape,
    );

    add(object);

    if (radius <= hole.radius) {
      possibleNotifier.value++;
    }
  }

  void _checkCollisions() {
    final objects = children.whereType<FallingObject>().toList();

    for (final object in objects) {
      if (_handledObjects.contains(object)) {
        continue;
      }

      if (object.radius > hole.radius) {
        continue;
      }

      final horizontalDistance = (object.position.x - hole.position.x).abs();

      final objectBottom = object.position.y + object.radius;

      final holeTop = hole.position.y - hole.radius;

      final reachedHole =
          objectBottom >= holeTop &&
          objectBottom <= hole.position.y + hole.radius;

      final horizontallyInside =
          horizontalDistance <= hole.radius - object.radius + 8;

      if (reachedHole && horizontallyInside) {
        _handledObjects.add(object);

        caughtNotifier.value++;

        object.removeFromParent();

        _checkLevelUp();
      }
    }
  }

  void _checkMissedObjects() {
    final objects = children.whereType<FallingObject>().toList();

    for (final object in objects) {
      if (_handledObjects.contains(object)) {
        continue;
      }

      if (object.position.y - object.radius > size.y) {
        _handledObjects.add(object);

        object.removeFromParent();
      }
    }
  }

  void _checkLevelUp() {
    final newLevel = (caughtNotifier.value ~/ 5) + 1;

    if (newLevel != level) {
      levelNotifier.value = newLevel;
    }
  }

  void moveHole(double x) {
    const wallGap = 1.5;

    final minimumX = hole.radius + wallGap;

    final maximumX = size.x - hole.radius - wallGap;

    hole.position.x = x.clamp(minimumX, maximumX);
  }

  @override
  void onRemove() {
    possibleNotifier.dispose();
    caughtNotifier.dispose();
    levelNotifier.dispose();

    _handledObjects.clear();

    super.onRemove();
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final InfiniteHoleGame game;

  @override
  void initState() {
    super.initState();

    game = InfiniteHoleGame();
  }

  @override
  void dispose() {
    game.onRemove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                game.moveHole(game.hole.position.x + details.delta.dx);
              },
              child: GameWidget(game: game),
            ),

            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 52,
                  margin: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.82),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Center(
                            child: ValueListenableBuilder<int>(
                              valueListenable: game.possibleNotifier,
                              builder: (_, possible, _) {
                                return FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'POSSIBLE: $possible',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Center(
                            child: ValueListenableBuilder<int>(
                              valueListenable: game.caughtNotifier,
                              builder: (_, caught, _) {
                                return FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'CAUGHT: $caught',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Center(
                            child: ValueListenableBuilder<int>(
                              valueListenable: game.levelNotifier,
                              builder: (_, level, _) {
                                return FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'LEVEL $level',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),

                      Expanded(
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'EXIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
