# UI Mockup: Material Farming Efficiency Analyzer

## Main Screen Layout

```
╔════════════════════════════════════════════════════════════╗
║  ← [素材収集効率分析]                                    ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║  ┌──────────────────────────────────────────────────┐    ║
║  │  ℹ️ ブックマークされた素材を基に、                  │    ║
║  │     最も効率的な秘境を分析します                   │    ║
║  │                                                    │    ║
║  │  分析時刻: 2025/10/11 22:13                       │    ║
║  └──────────────────────────────────────────────────┘    ║
║                                                            ║
║  【天賦素材の秘境】                                       ║
║                                                            ║
║  ┌────────────────────────────────────────────────┐      ║
║  │ 🏰 知恵の殿堂：タイシャンの庭園       [本日挑戦可能] │      ║
║  │                                                  │      ║
║  │ ⭐ 効率スコア: 42.5    📦 合計数量: 85           │      ║
║  │ ────────────────────────────────                │      ║
║  │ ブックマーク済み素材:                             │      ║
║  │                                                  │      ║
║  │  ┌─────────────────┐ ┌──────────────────┐      │      ║
║  │  │ 5 教導の哲学 ×18 │ │ 4 教導の指南 ×25  │      │      ║
║  │  └─────────────────┘ └──────────────────┘      │      ║
║  │  ┌─────────────────┐                            │      ║
║  │  │ 3 教導の教え ×42 │                            │      ║
║  │  └─────────────────┘                            │      ║
║  └────────────────────────────────────────────────┘      ║
║                                                            ║
║  ┌────────────────────────────────────────────────┐      ║
║  │ 🏰 秘境：抗争の座                                │      ║
║  │                                                  │      ║
║  │ ⭐ 効率スコア: 28.3    📦 合計数量: 52           │      ║
║  │ ────────────────────────────────                │      ║
║  │ ブックマーク済み素材:                             │      ║
║  │                                                  │      ║
║  │  ┌─────────────────┐ ┌──────────────────┐      │      ║
║  │  │ 5 抗争の哲学 ×12 │ │ 4 抗争の指南 ×18  │      │      ║
║  │  └─────────────────┘ └──────────────────┘      │      ║
║  │  ┌─────────────────┐                            │      ║
║  │  │ 3 抗争の教え ×22 │                            │      ║
║  │  └─────────────────┘                            │      ║
║  └────────────────────────────────────────────────┘      ║
║                                                            ║
║  【武器突破素材の秘境】                                    ║
║                                                            ║
║  ┌────────────────────────────────────────────────┐      ║
║  │ 🏰 秘境：連山宮                           [本日挑戦可能] │      ║
║  │                                                  │      ║
║  │ ⭐ 効率スコア: 35.8    📦 合計数量: 48           │      ║
║  │ ────────────────────────────────                │      ║
║  │ ブックマーク済み素材:                             │      ║
║  │                                                  │      ║
║  │  ┌─────────────────┐ ┌──────────────────┐      │      ║
║  │  │ 4 霧海の雲海 ×15 │ │ 3 霧海の露光 ×18  │      │      ║
║  │  └─────────────────┘ └──────────────────┘      │      ║
║  │  ┌─────────────────┐                            │      ║
║  │  │ 2 霧海の灯芯 ×15 │                            │      ║
║  │  └─────────────────┘                            │      ║
║  └────────────────────────────────────────────────┘      ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
```

## Empty State

```
╔════════════════════════════════════════════════════════════╗
║  ← [素材収集効率分析]                                    ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║                                                            ║
║                                                            ║
║                         📑                                 ║
║                                                            ║
║                  ブックマークがありません                    ║
║                                                            ║
║           素材をブックマークすると、                        ║
║           効率分析が表示されます                           ║
║                                                            ║
║                                                            ║
║                                                            ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
```

## Loading State

```
╔════════════════════════════════════════════════════════════╗
║  ← [素材収集効率分析]                                    ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║                                                            ║
║                                                            ║
║                                                            ║
║                          ⏳                                ║
║                      Loading...                            ║
║                                                            ║
║                                                            ║
║                                                            ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
```

## Color Scheme

### Rarity Colors

```
5★ Materials: 🟧 Orange (#F57C00)
  Example: [5 教導の哲学 ×18]

4★ Materials: 🟪 Purple (#9C27B0)
  Example: [4 教導の指南 ×25]

3★ Materials: 🟦 Blue (#2196F3)
  Example: [3 教導の教え ×42]

2★ Materials: 🟩 Green (#4CAF50)
  Example: [2 霧海の灯芯 ×15]

1★ Materials: ⬜ Gray (#9E9E9E)
  Example: [1 初心の教え ×30]
```

### State Colors

```
Available Today: 🟦 Primary Blue Container
  - Background: Light blue
  - Badge: Blue with white text
  - Enhanced elevation

Not Available: ⬜ Default Surface
  - Background: Card color
  - Standard elevation
```

## Component Breakdown

### Domain Card (Available Today)

```
┌────────────────────────────────────────────────┐
│ 🏰 知恵の殿堂：タイシャンの庭園    [本日挑戦可能] │ ← Title + Badge
│                                                │
│ ⭐ 効率スコア: 42.5    📦 合計数量: 85         │ ← Metrics Row
│ ──────────────────────────────────            │ ← Divider
│ ブックマーク済み素材:                           │ ← Section Label
│                                                │
│  ┌─────────────────┐ ┌──────────────────┐    │
│  │ 5 教導の哲学 ×18 │ │ 4 教導の指南 ×25  │    │ ← Material Chips
│  └─────────────────┘ └──────────────────┘    │
│  ┌─────────────────┐                          │
│  │ 3 教導の教え ×42 │                          │
│  └─────────────────┘                          │
└────────────────────────────────────────────────┘
```

### Domain Card (Not Available)

```
┌────────────────────────────────────────────────┐
│ 🏰 秘境：抗争の座                              │ ← Title only
│                                                │
│ ⭐ 効率スコア: 28.3    📦 合計数量: 52         │ ← Metrics Row
│ ──────────────────────────────────────            │ ← Divider
│ ブックマーク済み素材:                           │ ← Section Label
│                                                │
│  ┌─────────────────┐ ┌──────────────────┐    │
│  │ 5 抗争の哲学 ×12 │ │ 4 抗争の指南 ×18  │    │ ← Material Chips
│  └─────────────────┘ └──────────────────┘    │
│  ┌─────────────────┐                          │
│  │ 3 抗争の教え ×22 │                          │
│  └─────────────────┘                          │
└────────────────────────────────────────────────┘
```

### Material Chip Structure

```
┌─────────────────┐
│ [5] 教導の哲学 ×18 │
│  ^    ^        ^  │
│  │    │        └─ Quantity
│  │    └────────── Material Name
│  └─────────────── Rarity Badge (colored circle)
└─────────────────┘
```

## Interaction States

### Card Hover/Focus

```
┌────────────────────────────────────────────────┐
│ 🏰 知恵の殿堂：タイシャンの庭園    [本日挑戦可能] │
│                                                │ ← Elevation increases
│ ⭐ 効率スコア: 42.5    📦 合計数量: 85         │ ← Subtle scale up
│ ──────────────────────────────────            │
│ (content...)                                   │
└────────────────────────────────────────────────┘
  ↑ Ripple effect on tap
```

### Chip Hover/Focus

```
┌─────────────────┐
│ [5] 教導の哲学 ×18 │ ← Background lightens
└─────────────────┘ ← Border appears
```

## Responsive Behavior

### Mobile (< 600dp)

```
║ Single column layout
║ Full-width cards
║ Chips wrap to multiple rows
║ Reduced padding
```

### Tablet (600-840dp)

```
║ Slightly wider margins
║ Comfortable touch targets
║ More horizontal space for chips
```

### Desktop (> 840dp)

```
║ Maximum content width
║ Centered layout
║ Larger text for readability
```

## Animation Behavior

### Page Load

1. Fade in: Summary card (200ms)
2. Slide up: Section headers (100ms delay)
3. Stagger in: Domain cards (50ms between each)

### Card Interactions

1. Ripple: On tap (Material design standard)
2. Elevation: Hover/focus state change
3. Chips: Subtle press animation

### Loading State

1. Spinner: Circular progress indicator
2. Fade: Smooth transition to content

## Accessibility

### Screen Reader Announcements

```
"Domain: Taishan Mansion"
"Efficiency score: 42.5"
"Total quantity: 85 items"
"Available today"
"Bookmarked materials: 3 items"
"Philosophies of Diligence, rarity 5 stars, quantity 18"
```

### Focus Order

1. Back button
2. Summary card
3. Domain cards (top to bottom)
4. Material chips (left to right, top to bottom)

### Contrast Ratios

- Text on background: > 4.5:1
- Badge text on badge: > 4.5:1
- Rarity badges: Sufficient contrast
- Focus indicators: 3:1 minimum

---

This mockup provides a complete visual reference for the Material Farming Efficiency Analyzer UI implementation.
