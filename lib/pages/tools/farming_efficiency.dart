import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/intl.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/center_text.dart";
import "../../core/asset_cache.dart";
import "../../i18n/strings.g.dart";
import "../../models/farming_efficiency.dart";
import "../../providers/farming_efficiency.dart";
import "../../providers/preferences.dart";
import "../../providers/versions.dart";
import "../../ui_core/error_messages.dart";
import "../../ui_core/layout.dart";

class FarmingEfficiencyPage extends ConsumerWidget {
  const FarmingEfficiencyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysisAsync = ref.watch(farmingEfficiencyAnalysisProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.farmingEfficiency),
      ),
      body: switch (analysisAsync) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncData(:final value) => value.totalBookmarks == 0
            ? _NoBookmarksWidget()
            : _FarmingEfficiencyContent(analysis: value),
        AsyncError(:final error) => CenterText(getErrorMessage(error)),
      },
    );
  }
}

class _NoBookmarksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Symbols.bookmark_add,
              size: 64,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(height: 16),
            Text(
              tr.farmingEfficiencyPage.noBookmarks,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              tr.farmingEfficiencyPage.noBookmarksDesc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FarmingEfficiencyContent extends ConsumerWidget {
  final FarmingEfficiencyAnalysis analysis;

  const _FarmingEfficiencyContent({required this.analysis});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final server = ref.watch(preferencesStateProvider.select((s) => s.dailyResetServer));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.0,
        children: [
          // Description card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.0,
                children: [
                  Row(
                    children: [
                      Icon(
                        Symbols.analytics,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tr.farmingEfficiencyPage.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${tr.farmingEfficiencyPage.analyzedAt}: ${DateFormat.yMd().add_Hms().format(analysis.analyzedAt)}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
          ),

          // Talent domains section
          if (analysis.talentDomains.isNotEmpty) ...[
            Section(
              heading: SectionHeading(tr.farmingEfficiencyPage.talentDomains),
              child: Column(
                spacing: 12.0,
                children: [
                  for (final domain in analysis.talentDomains)
                    _DomainCard(domain: domain, assetData: assetData, server: server),
                ],
              ),
            ),
          ],

          // Weapon domains section
          if (analysis.weaponDomains.isNotEmpty) ...[
            Section(
              heading: SectionHeading(tr.farmingEfficiencyPage.weaponDomains),
              child: Column(
                spacing: 12.0,
                children: [
                  for (final domain in analysis.weaponDomains)
                    _DomainCard(domain: domain, assetData: assetData, server: server),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DomainCard extends StatelessWidget {
  final DomainEfficiency domain;
  final AssetData assetData;
  final GameServer server;

  const _DomainCard({
    required this.domain,
    required this.assetData,
    required this.server,
  });

  @override
  Widget build(BuildContext context) {
    final isAvailableToday = domain.isAvailableToday(server);

    return Card(
      elevation: isAvailableToday ? 4 : 1,
      color: isAvailableToday
          ? Theme.of(context).colorScheme.primaryContainer
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.0,
          children: [
            // Domain name and availability
            Row(
              children: [
                Expanded(
                  child: Text(
                    domain.domainName.localized,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isAvailableToday
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : null,
                        ),
                  ),
                ),
                if (isAvailableToday)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tr.farmingEfficiencyPage.availableToday,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
              ],
            ),

            // Efficiency score
            Row(
              children: [
                Icon(
                  Symbols.star,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 4),
                Text(
                  "${tr.farmingEfficiencyPage.efficiencyScore}: ${domain.efficiencyScore.toStringAsFixed(1)}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isAvailableToday
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : null,
                      ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Symbols.inventory_2,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 4),
                Text(
                  "${tr.farmingEfficiencyPage.totalQuantity}: ${domain.totalBookmarkedQuantity}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isAvailableToday
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : null,
                      ),
                ),
              ],
            ),

            const Divider(),

            // Materials list
            Text(
              tr.farmingEfficiencyPage.bookmarkedMaterials,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: isAvailableToday
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : null,
                  ),
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (final material in domain.materials)
                  _MaterialChip(material: material, isHighlighted: isAvailableToday),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MaterialChip extends StatelessWidget {
  final MaterialEfficiency material;
  final bool isHighlighted;

  const _MaterialChip({
    required this.material,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: _getRarityColor(material.rarity, context),
        child: Text(
          material.rarity.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      label: Text(
        "${material.materialName.localized} ×${material.bookmarkedQuantity}",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isHighlighted
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : null,
        ),
      ),
      backgroundColor: isHighlighted
          ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7)
          : null,
    );
  }

  Color _getRarityColor(int rarity, BuildContext context) {
    switch (rarity) {
      case 5:
        return Colors.orange.shade700;
      case 4:
        return Colors.purple.shade400;
      case 3:
        return Colors.blue.shade400;
      case 2:
        return Colors.green.shade400;
      default:
        return Colors.grey.shade400;
    }
  }
}
