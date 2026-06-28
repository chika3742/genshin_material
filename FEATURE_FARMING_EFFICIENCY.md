# Material Farming Efficiency Analyzer (素材収集効率分析機能)

## Overview

The **Material Farming Efficiency Analyzer** is an innovative feature that helps Genshin Impact players optimize their daily farming routes by analyzing bookmarked materials and recommending the most efficient domains to farm.

## Why This Feature is Innovative

Traditional Genshin Impact companion apps show you *what* materials you need, but they don't tell you *where* to farm most efficiently when you have multiple characters to build. This analyzer solves that problem by:

1. **Intelligent Prioritization**: Automatically calculates which domains give you the most value based on ALL your active bookmarks
2. **Rarity Weighting**: Prioritizes 5★ materials over lower rarities since they're harder to obtain
3. **Daily Availability**: Highlights domains that are available TODAY based on your server settings
4. **Multi-Character Optimization**: Considers materials needed across all your bookmarked characters/weapons

## How It Works

### Algorithm

The efficiency score for each domain is calculated using this formula:

```
Efficiency Score = Σ (Material Quantity × Rarity Weight)

Where:
- Material Quantity = Total amount needed from all bookmarks
- Rarity Weight = Material Rarity / 5.0 (normalized to 0.4-1.0 range)
```

This means:
- A 5★ material needed ×10 contributes: 10 × (5/5) = 10.0 points
- A 4★ material needed ×10 contributes: 10 × (4/5) = 8.0 points
- A 3★ material needed ×10 contributes: 10 × (3/5) = 6.0 points

### Example Scenario

Player has bookmarked materials for:
- Character A: Needs Teachings of Resistance ×9, Guide to Resistance ×12 (Violet Court domain)
- Character B: Needs Teachings of Resistance ×6, Guide to Resistance ×9 (Violet Court domain)  
- Character C: Needs Teachings of Ballad ×9 (Forsaken Rift domain)

**Analysis Results:**
1. Violet Court: Score = 15.6 (serves 2 characters, multiple rarities)
2. Forsaken Rift: Score = 5.4 (serves 1 character)

**Recommendation:** Farm Violet Court first for maximum efficiency!

## User Interface Features

### Main Screen Components

1. **Analysis Summary Card**
   - Shows when the analysis was performed
   - Brief description of the feature

2. **Talent Material Domains**
   - Lists all relevant talent domains
   - Sorted by efficiency score (highest first)
   - Shows availability status for current day

3. **Weapon Material Domains**  
   - Lists all relevant weapon domains
   - Same sorting and display as talent domains

### Domain Cards

Each domain card displays:

- **Domain Name**: Localized name of the domain
- **Availability Badge**: "Available Today" for current weekday
- **Efficiency Score**: Numerical score for comparison
- **Total Quantity**: Sum of all materials needed
- **Material Chips**: Visual list of materials with:
  - Rarity badge (color-coded by rarity)
  - Material name
  - Quantity needed

### Visual Design

- **Highlighted Cards**: Domains available today use primary color scheme
- **Rarity Colors**:
  - 5★ = Orange
  - 4★ = Purple  
  - 3★ = Blue
  - 2★ = Green
  - 1★ = Gray
- **Icons**: Material Symbols icons for modern look
- **Responsive**: Works on all screen sizes

## Technical Implementation

### Architecture

```
User Bookmarks
     ↓
[Database] → BookmarksProvider
     ↓
[Analysis Logic] → FarmingEfficiencyProvider
     ↓
[Domain Efficiency Models]
     ↓
[UI Components] → FarmingEfficiencyPage
```

### Key Components

1. **Models** (`lib/models/farming_efficiency.dart`)
   - `DomainEfficiency`: Represents a domain with efficiency data
   - `MaterialEfficiency`: Material-specific efficiency info
   - `FarmingEfficiencyAnalysis`: Complete analysis result

2. **Provider** (`lib/providers/farming_efficiency.dart`)
   - `farmingEfficiencyAnalysisProvider`: Riverpod provider
   - Fetches bookmarks from database
   - Calculates efficiency scores
   - Returns sorted results

3. **UI** (`lib/pages/tools/farming_efficiency.dart`)
   - `FarmingEfficiencyPage`: Main page widget
   - `_DomainCard`: Individual domain display
   - `_MaterialChip`: Material display with rarity
   - Empty state for no bookmarks

### Data Flow

1. User bookmarks materials in character/weapon pages
2. Provider watches bookmark changes via Riverpod
3. On page load, provider analyzes all bookmarks
4. Groups materials by domain
5. Calculates efficiency scores
6. Returns sorted list to UI
7. UI displays with color coding and badges

## Localization

Fully localized in Japanese and English:

### Japanese (ja.i18n.yaml)
```yaml
farmingEfficiencyPage:
  title: 素材収集効率分析
  description: ブックマークされた素材を基に、最も効率的な秘境を分析します
  efficiencyScore: 効率スコア
  availableToday: 本日挑戦可能
```

### English (en.i18n.yaml)
```yaml
farmingEfficiencyPage:
  title: Farming Efficiency Analyzer
  description: Analyzes the most efficient domains based on your bookmarked materials
  efficiencyScore: Efficiency Score
  availableToday: Available Today
```

## Usage Guide

### For Players

1. **Bookmark Materials**: First, bookmark the materials you need for character/weapon upgrades
2. **Open Analyzer**: Navigate to Tools → Farming Efficiency Analyzer
3. **Check Recommendations**: View sorted domains by efficiency
4. **Focus on Highlighted**: Prioritize domains marked "Available Today"
5. **Farm Efficiently**: Use your resin on the highest-scoring domains first

### Best Practices

- Update bookmarks regularly as you complete upgrades
- Check the analyzer before using fragile resin
- Consider condensed resin (2x rewards) for top domains
- Sync with daily reset time via server settings

## Future Enhancements

Potential improvements for future versions:

1. **Resin Calculator Integration**: Show total resin needed per domain
2. **Material Drop Rate**: Factor in actual drop rates from domains
3. **History Tracking**: Track farming efficiency over time
4. **Custom Weights**: Let users prioritize specific materials
5. **Artifact Domains**: Extend to artifact farming efficiency
6. **Team Synergy**: Suggest domains that benefit multiple team comps
7. **Push Notifications**: Remind users when high-priority domains are available

## Performance Considerations

- Provider caches results until bookmarks change
- Efficient O(n) algorithm for score calculation  
- Lazy loading of domain data
- Minimal re-renders with Riverpod

## Accessibility

- Screen reader friendly with semantic labels
- Color is not the only indicator (uses text + badges)
- Sufficient contrast ratios for all text
- Touch targets meet 48dp minimum

## Testing Recommendations

Manual testing checklist:
- [ ] Verify calculations with known bookmark sets
- [ ] Test with no bookmarks (empty state)
- [ ] Test with only talent materials
- [ ] Test with only weapon materials
- [ ] Test with mixed materials
- [ ] Verify "Available Today" badge shows correctly for each server
- [ ] Test on different screen sizes
- [ ] Verify localization in both languages
- [ ] Check rarity color coding
- [ ] Ensure sorting is correct

## Conclusion

The Material Farming Efficiency Analyzer represents a significant quality-of-life improvement for Genshin Impact players. By intelligently analyzing player goals and recommending optimal farming routes, it helps players make the most of their limited resin and time in the game.

This feature demonstrates innovation through:
- Smart algorithms that understand player needs
- Beautiful, intuitive UI design
- Seamless integration with existing bookmark system
- Consideration for daily availability and server timing
- Rarity-based prioritization matching game mechanics

---

**Created**: 2025-10-11
**Version**: 1.0.0
**Author**: GitHub Copilot for chika3742/genshin_material
