import "dart:io";
import "dart:math";

import "package:assorted_layout_widgets/assorted_layout_widgets.dart";
import "package:collection/collection.dart";
import "package:flutter/material.dart" hide Material;
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/intl.dart";
import "package:material_symbols_icons/symbols.dart";

import "../composables/use_periodic_timer.dart";
import "../core/kv_preferences.dart";
import "../core/theme.dart";
import "../db/material_bag_count_db_extension.dart";
import "../models/common.dart";
import "../providers/database_provider.dart";
import "../providers/preferences.dart";
import "../providers/versions.dart";
import "../routes.dart";
import "../ui_core/layout.dart";

class MaterialCard extends StatelessWidget {
  /// Image file of the material.
  final File image;

  /// Name of the material.
  final String name;

  final bool showName;

  /// Rarity of the material.
  final int? rarity;

  final int quantity;

  /// Material ID for linking to the material details.
  final String id;

  final BookmarkState? bookmarkState;

  final bool dailyMaterialAvailable;

  /// Callback for bookmarking the material.
  final void Function()? onBookmark;

  final void Function()? onSwapExpItem;

  const MaterialCard({
    super.key,
    required this.image,
    required this.name,
    this.showName = true,
    this.rarity,
    required this.quantity,
    required this.id,
    this.bookmarkState,
    this.dailyMaterialAvailable = false,
    this.onBookmark,
    this.onSwapExpItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: RowSuper(
          mainAxisSize: MainAxisSize.min,
          innerDistance: -8,
          children: [
            if (rarity != null)
              SizedBox(
                width: 6,
                height: 60,
                child: CustomPaint(
                  painter: _RarityCornerMarkerPainter(
                    Theme.of(context).extension<ComponentThemeExtension>()!
                        .getRarityColor(rarity!).withOpacity(0.8),
                  ),
                ),
              ),
            const SizedBox(width: 16),
            if (onSwapExpItem != null) IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Symbols.swap_horiz),
              onPressed: onSwapExpItem,
            ),
            SizedBox(
              height: 60,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {
                  MaterialDetailsRoute(id: id).push(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GappedRow(
                    gap: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.file(image, width: 35, height: 35),
                      if (showName) Expanded(
                        child: Text(name, style: const TextStyle(fontSize: 16)),
                      ),
                      if (dailyMaterialAvailable)
                        const Icon(Symbols.event_available, color: Colors.green, weight: 700),
                      _MaterialQuantity(
                        requiredNum: quantity,
                        materialId: id,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (onBookmark != null && bookmarkState != null) IconTheme(
              data: Theme.of(context).iconTheme.copyWith(
                fill: switch (bookmarkState!) {
                  BookmarkState.bookmarked => 1,
                  BookmarkState.partial => 1,
                  BookmarkState.none => 1,
                },
                color: switch (bookmarkState!) {
                  BookmarkState.bookmarked => Colors.orange,
                  BookmarkState.partial => Colors.lightGreen,
                  BookmarkState.none => null,
                },
              ),
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(switch (bookmarkState!) {
                    BookmarkState.bookmarked => Symbols.bookmark_added,
                    BookmarkState.partial => Symbols.bookmark_remove,
                    BookmarkState.none => Symbols.bookmark_add,
                  },),
                  onPressed: onBookmark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RarityCornerMarkerPainter extends CustomPainter {
  final Color color;

  const _RarityCornerMarkerPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(size.width, 0) // upper right corner
      ..lineTo(size.width, size.height) // lower right corner
      ..arcToPoint(
        Offset(0, size.height - size.width),
        radius: Radius.circular(size.width),
      ) // end of the arc at the LOWER LEFT corner
      ..lineTo(0, size.width) // end of the arc at the UPPER LEFT corner
      ..arcToPoint(
        Offset(size.width, 0),
        radius: Radius.circular(size.width),
      ); // upper right corner
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MaterialQuantity extends HookConsumerWidget {
  final int requiredNum;
  final String materialId;

  const _MaterialQuantity({required this.requiredNum, required this.materialId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);
    final uid = ref.watch(preferencesStateNotifierProvider.select((e) => e.hyvUid));
    final syncEnabled = ref.watch(preferencesStateNotifierProvider.select((e) => e.syncBagCounts));
    final assetData = ref.watch(assetDataProvider).value;
    if (assetData == null) {
      throw "Asset data not loaded";
    }
    final material = assetData.materials[materialId];
    if (material == null) {
      throw "Material not found: $materialId";
    }

    final craftables = useMemoized(() {
      return assetData.materials.values
          .where((e) => e.groupId != null &&
              e.groupId == material.groupId &&
              e.craftLevel! < material.craftLevel!,);
    }, [materialId],);

    final bagCountSnapshot = useStream(
      useMemoized(
        () => uid != null && syncEnabled
            ? db.watchMaterialBagCounts(uid, [material.hyvId, ...craftables.map((e) => e.hyvId)])
            : null,
        [uid, syncEnabled, materialId, assetData],
      ),
      preserveState: false,
    );
    final bagCounts = bagCountSnapshot.data;

    final bagCount = bagCounts?.firstWhereOrNull((e) => e.hyvId == material.hyvId);
    int? lackNum;
    int? craftedLackNum;
    if (bagCount != null) {
      lackNum = bagCount.count - requiredNum;

      if (craftables.isNotEmpty) {
        int craftedBagCount = bagCount.count;
        for (final craftable in craftables) {
          final bagCount = bagCounts!.firstWhereOrNull((e) => e.hyvId == craftable.hyvId);
          if (bagCount != null) {
            craftedBagCount += bagCount.count ~/ pow(3, material.craftLevel! - craftable.craftLevel!);
          }
        }
        craftedLackNum = craftedBagCount - requiredNum;
      }
    }

    return _QuantityCrossFade(
      requiredNumChild: _AnimatedQuantity(requiredNum),
      lackNumChild: lackNum != null ? Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(
                  Symbols.shopping_bag,
                  size: 20,
                ),
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(
              text: "${lackNum >= 0 ? "+" : ""}$lackNum",
              style: GoogleFonts.titilliumWeb(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        style: TextStyle(color: lackNum < 0 ? Colors.red : Colors.green),
      ) : null,
      craftedLackNumChild: craftedLackNum != null ? Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(
                  Symbols.orbit,
                  size: 20,
                ),
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(
              text: "${craftedLackNum >= 0 ? "+" : ""}$craftedLackNum",
              style: GoogleFonts.titilliumWeb(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        style: TextStyle(color: craftedLackNum < 0 ? Colors.red : Colors.green),
      ) : null,
    );
  }
}

class _QuantityCrossFade extends HookConsumerWidget {
  final Widget requiredNumChild;
  final Widget? lackNumChild;
  final Widget? craftedLackNumChild;
  
  const _QuantityCrossFade({required this.requiredNumChild, this.lackNumChild, this.craftedLackNumChild});

  static const _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alternateState = useValueListenable(QuantityStateProvider.of(context).state);
    final mode = ref.watch(preferencesStateNotifierProvider.select((e) => e.lackNumDisplayMethod));

    QuantityState getActualState(QuantityState state) {
      return switch (state) {
        QuantityState.requiredNum => state,

        QuantityState.lackNum when lackNumChild != null => state,
        QuantityState.lackNum => QuantityState.requiredNum, // fallback

        QuantityState.craftedLackNum when craftedLackNumChild != null => state,
        QuantityState.craftedLackNum when lackNumChild != null => QuantityState.lackNum, // fallback
        QuantityState.craftedLackNum => QuantityState.requiredNum, // fallback
      };
    }

    final currentState = switch (mode) {
      LackNumDisplayMethod.alternate => getActualState(alternateState),
      LackNumDisplayMethod.requiredNumOnly => getActualState(QuantityState.requiredNum),
      LackNumDisplayMethod.lackNumOnly => getActualState(QuantityState.lackNum),
      LackNumDisplayMethod.craftedLackNumOnly => getActualState(QuantityState.craftedLackNum),
    };

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        if (!mode.isSingleShowMode || currentState == QuantityState.requiredNum)
          AnimatedOpacity(
            duration: _animationDuration,
            opacity: currentState == QuantityState.requiredNum ? 1 : 0,
            child: requiredNumChild,
          ),
        if (lackNumChild != null && (!mode.isSingleShowMode || currentState == QuantityState.lackNum))
          AnimatedOpacity(
            duration: _animationDuration,
            opacity: currentState == QuantityState.lackNum ? 1 : 0,
            child: lackNumChild,
          ),
        if (craftedLackNumChild != null && (!mode.isSingleShowMode || currentState == QuantityState.craftedLackNum))
          AnimatedOpacity(
            duration: _animationDuration,
            opacity: currentState == QuantityState.craftedLackNum ? 1 : 0,
            child: craftedLackNumChild,
          ),
      ],
    );
  }
}

class _AnimatedQuantity extends HookWidget {
  final int quantity;
  
  const _AnimatedQuantity(this.quantity);

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: useSingleTickerProvider(),
    );
    final tween = useState(IntTween(begin: quantity, end: quantity));

    final animatedNum = useAnimation(
      tween.value.animate(animationController.drive(CurveTween(curve: Easing.emphasizedDecelerate))),
    );

    useValueChanged<int, int>(quantity, (prev, _) {
      animationController.reset();
      tween.value = IntTween(begin: prev, end: quantity);
      animationController.forward();
      return null;
    });
    
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "x", style: GoogleFonts.titilliumWeb(fontSize: 18)),
          TextSpan(
            text: NumberFormat.decimalPattern().format(animatedNum),
            style: GoogleFonts.titilliumWeb(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Syncs the quantity display state on [MaterialCard].
class QuantityTickerHandler extends HookConsumerWidget {
  final Widget child;

  const QuantityTickerHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfState = useValueNotifier(QuantityState.requiredNum);
    final enabled = ref.watch(preferencesStateNotifierProvider.select((e) => e.lackNumDisplayMethod == LackNumDisplayMethod.alternate));
    final enabledRef = useRef(enabled);
    useValueChanged<bool, void>(enabled, (_, __) {
      enabledRef.value = enabled;
    });
    usePeriodicTimer(const Duration(seconds: 3), (timer) {
      if (TickerMode.of(context) && enabledRef.value) {
        cfState.value = QuantityState.values[(cfState.value.index + 1) % QuantityState.values.length];
      }
    });

    return QuantityStateProvider(
      state: cfState,
      child: child,
    );
  }
}

class QuantityStateProvider extends InheritedWidget {
  final ValueNotifier<QuantityState> state;

  const QuantityStateProvider({
    super.key,
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(QuantityStateProvider oldWidget) {
    return oldWidget.state != state;
  }

  static QuantityStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<QuantityStateProvider>()!;
  }
}

enum QuantityState {
  requiredNum,
  lackNum,
  craftedLackNum,
}
