import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../components/game_data_sync_indicator.dart";
import "../../components/list_tile.dart";
import "../../ui_core/page_transition.dart";
import "component_detail.dart";

class ComponentGalleryPage extends StatelessWidget {
  const ComponentGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Component Gallery"),
      ),
      body: ListView(
        children: [
          SimpleListTile(
            title: "GameDataSyncIndicator",
            onTap: () {
              _pushComponentDetail(
                context: context,
                title: "GameDataSyncIndicator",
                child: HookBuilder(
                  builder: (context) {
                    final status = useState(const GameDataSyncStatus.syncing());
                    useEffect(() {
                      Future.delayed(const Duration(seconds: 2), () {
                        status.value = const GameDataSyncStatus.synced();
                      });
                      return null;
                    }, const [],);

                    return GameDataSyncIndicator(
                      status: status.value,
                      // show: true,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _pushComponentDetail({required BuildContext context, required String title, required Widget child}) {
    Navigator.of(context, rootNavigator: true).push(
      buildTransitionedPage(
        context: context,
        child: ComponentDetailPage(
          title: title,
          child: child,
        ),
      ).createRoute(context),
    );
  }
}
