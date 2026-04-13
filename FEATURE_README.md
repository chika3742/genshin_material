# 🎯 Material Farming Efficiency Analyzer

> An innovative feature for optimizing Genshin Impact material farming

[![Status](https://img.shields.io/badge/Status-Implemented-success)]()
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)]()
[![Language](https://img.shields.io/badge/Language-Dart%2FFlutter-02569B)]()

## 📖 Quick Links

- [🇬🇧 English Documentation](FEATURE_FARMING_EFFICIENCY.md) - Complete feature documentation
- [🇯🇵 日本語実装サマリー](IMPLEMENTATION_SUMMARY_JA.md) - Implementation summary in Japanese
- [🔄 Flow Diagrams](docs/farming_efficiency_flow.md) - Visual flow and architecture diagrams

## ✨ What's New

The app now includes an intelligent **Farming Efficiency Analyzer** that helps players optimize their daily domain farming routes by:

- 🎯 **Smart Analysis**: Automatically analyzes all bookmarked materials
- 📊 **Efficiency Scoring**: Calculates which domains provide the most value
- 🌟 **Rarity Weighting**: Prioritizes 5★ materials (harder to obtain)
- 📅 **Daily Recommendations**: Highlights domains available TODAY
- 🎨 **Beautiful UI**: Color-coded materials, efficiency badges, and modern design

## 🚀 Quick Start

### For Users

1. **Bookmark materials** you need in character/weapon pages
2. Navigate to **Tools → Farming Efficiency Analyzer**
3. View **sorted domains** by efficiency score
4. **Farm the top-ranked domains** first for maximum efficiency!

### For Developers

```dart
// The feature is built with:
- Riverpod for state management
- Freezed for immutable models
- Material 3 design system
- Full localization (ja/en)

// Main entry point:
lib/pages/tools/farming_efficiency.dart

// Business logic:
lib/providers/farming_efficiency.dart

// Data models:
lib/models/farming_efficiency.dart
```

## 📊 Example Output

```
📊 Talent Material Domains

╔═══════════════════════════════════════╗
║ Domain of Mastery: Taishan Mansion   ║ [AVAILABLE TODAY]
║ Efficiency Score: 42.5                ║
║ Total Quantity: 85 items              ║
║                                       ║
║ Materials:                            ║
║ ⭐⭐⭐⭐⭐ Philosophies of Diligence ×18 ║
║ ⭐⭐⭐⭐ Guide to Diligence ×25          ║
║ ⭐⭐⭐ Teachings of Diligence ×42       ║
╚═══════════════════════════════════════╝
```

## 🎨 Features

### Smart Algorithm
- Weighted scoring based on material rarity
- Multi-character optimization
- Real-time bookmark integration

### User Experience
- Empty state guidance
- Loading states
- Error handling
- Responsive design

### Localization
- 🇯🇵 Japanese (ja)
- 🇬🇧 English (en)

## 🏗️ Architecture

```
┌─────────────────────────────────┐
│   FarmingEfficiencyPage (UI)   │
└───────────┬─────────────────────┘
            │
            ▼
┌─────────────────────────────────┐
│  farmingEfficiencyAnalysis      │
│        Provider (Logic)          │
└───────────┬─────────────────────┘
            │
            ▼
┌─────────────────────────────────┐
│   BookmarksProvider (Data)      │
│   AssetDataProvider (Data)      │
└───────────┬─────────────────────┘
            │
            ▼
┌─────────────────────────────────┐
│     SQLite Database (Drift)     │
└─────────────────────────────────┘
```

## 📈 Efficiency Formula

```
Efficiency Score = Σ (Material Quantity × Rarity Weight)

Where Rarity Weight = Material Rarity / 5.0

Example:
- 5★ material ×10 = 10 × 1.0 = 10.0 points
- 4★ material ×10 = 10 × 0.8 = 8.0 points
- 3★ material ×10 = 10 × 0.6 = 6.0 points
```

## 🎯 Key Files

| File | Description |
|------|-------------|
| `lib/models/farming_efficiency.dart` | Data models |
| `lib/providers/farming_efficiency.dart` | Business logic |
| `lib/pages/tools/farming_efficiency.dart` | UI implementation |
| `lib/i18n/ja.i18n.yaml` | Japanese strings |
| `lib/i18n/en.i18n.yaml` | English strings |

## 🔮 Future Enhancements

- [ ] Resin calculator integration
- [ ] Material drop rate consideration
- [ ] History tracking
- [ ] Custom material weights
- [ ] Artifact domain support
- [ ] Push notifications

## 🧪 Testing Checklist

- [x] Algorithm correctness
- [x] UI responsiveness
- [x] Localization (ja/en)
- [x] Empty state handling
- [x] Error handling
- [x] Daily availability logic
- [ ] Integration tests
- [ ] E2E tests

## 💡 Innovation Highlights

### Why This Is Innovative

Most Genshin companion apps tell you **what** materials you need. This feature tells you **where** to farm most efficiently when building multiple characters.

1. **Multi-Character Awareness**: Considers ALL your bookmarks simultaneously
2. **Smart Prioritization**: Automatically weighs materials by rarity
3. **Time-Aware**: Knows what's available today based on your server
4. **Zero Setup**: Works with existing bookmarks - no configuration needed
5. **Visual Clarity**: Makes optimal choices immediately obvious

## 📝 License

This feature is part of the genshin_material project.

## 👤 Author

Implemented by GitHub Copilot for [chika3742/genshin_material](https://github.com/chika3742/genshin_material)

---

**Created**: 2025-10-11  
**Status**: ✅ Complete & Documented  
**Version**: 1.0.0
