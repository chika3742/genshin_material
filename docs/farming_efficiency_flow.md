# Farming Efficiency Analyzer - Flow Diagram

## User Flow

```
┌─────────────────────────────────────────────────────────────┐
│                     User Opens App                           │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│           User Bookmarks Materials                           │
│  (Character Pages, Weapon Pages)                            │
│  ✓ Character A: Talent materials                            │
│  ✓ Character B: Ascension materials                         │
│  ✓ Weapon X: Enhancement materials                          │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│          Navigate to Tools Page                              │
│                   ↓                                          │
│     Select "Farming Efficiency Analyzer"                     │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              Analysis Engine Activates                       │
│                                                              │
│  1. Fetch all active bookmarks from database                │
│  2. Group materials by domain                               │
│  3. Calculate efficiency scores                             │
│  4. Sort by score (highest first)                           │
│  5. Check availability for current day                      │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│            Display Results to User                           │
│                                                              │
│  📊 Talent Material Domains                                 │
│     ╔════════════════════════════════════════╗              │
│     ║ 🌟 Domain of Mastery: Realm of Blessing║ [TODAY]      │
│     ║ Efficiency Score: 42.5                 ║              │
│     ║ Total Quantity: 85 items               ║              │
│     ║                                        ║              │
│     ║ Materials:                             ║              │
│     ║ • ⭐⭐⭐⭐⭐ Philosophies of Gold ×18       ║              │
│     ║ • ⭐⭐⭐⭐ Guide to Gold ×25               ║              │
│     ║ • ⭐⭐⭐ Teachings of Gold ×42            ║              │
│     ╚════════════════════════════════════════╝              │
│                                                              │
│     ╔════════════════════════════════════════╗              │
│     ║ Domain of Blessing: Ridge Watch        ║              │
│     ║ Efficiency Score: 28.3                 ║              │
│     ║ Total Quantity: 52 items               ║              │
│     ║                                        ║              │
│     ║ Materials:                             ║              │
│     ║ • ⭐⭐⭐⭐⭐ Philosophies of Resistance ×12 ║              │
│     ║ • ⭐⭐⭐⭐ Guide to Resistance ×18         ║              │
│     ║ • ⭐⭐⭐ Teachings of Resistance ×22      ║              │
│     ╚════════════════════════════════════════╝              │
│                                                              │
│  🗡️ Weapon Material Domains                                │
│     ╔════════════════════════════════════════╗              │
│     ║ Hidden Palace of Lianshan Formula      ║ [TODAY]      │
│     ║ Efficiency Score: 35.8                 ║              │
│     ║ ...                                    ║              │
│     ╚════════════════════════════════════════╝              │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│           User Makes Farming Decision                        │
│                                                              │
│  ✅ Farm domains marked [TODAY] first                       │
│  ✅ Focus on highest efficiency scores                      │
│  ✅ Use condensed resin for top priorities                  │
└─────────────────────────────────────────────────────────────┘
```

## Data Flow Architecture

```
┌──────────────────────────────────────────────────────────────┐
│                      Presentation Layer                       │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐    │
│  │      FarmingEfficiencyPage (UI Component)           │    │
│  │  • Displays domain cards                            │    │
│  │  • Shows efficiency scores                          │    │
│  │  • Highlights available domains                     │    │
│  │  • Handles empty states                             │    │
│  └─────────────────┬───────────────────────────────────┘    │
│                    │ reads from                              │
└────────────────────┼─────────────────────────────────────────┘
                     │
                     ▼
┌──────────────────────────────────────────────────────────────┐
│                      Business Logic Layer                     │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐    │
│  │   FarmingEfficiencyProvider (Riverpod)              │    │
│  │  • farmingEfficiencyAnalysisProvider                │    │
│  │  • Watches bookmark changes                         │    │
│  │  • Triggers recalculation on updates                │    │
│  └─────────────────┬───────────────────────────────────┘    │
│                    │ processes                               │
│                    ▼                                          │
│  ┌─────────────────────────────────────────────────────┐    │
│  │      Analysis Engine (_analyzeDomains)              │    │
│  │  1. Group materials by domain                       │    │
│  │  2. Calculate weighted scores                       │    │
│  │  3. Sort by efficiency                              │    │
│  │  4. Check daily availability                        │    │
│  └─────────────────┬───────────────────────────────────┘    │
│                    │ uses                                    │
└────────────────────┼─────────────────────────────────────────┘
                     │
                     ▼
┌──────────────────────────────────────────────────────────────┐
│                         Data Layer                            │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐    │
│  │         BookmarksProvider                           │    │
│  │  • Fetches active bookmarks                         │    │
│  │  • Filters material bookmarks                       │    │
│  └─────────────────┬───────────────────────────────────┘    │
│                    │ queries                                 │
│                    ▼                                          │
│  ┌─────────────────────────────────────────────────────┐    │
│  │        AssetDataProvider                            │    │
│  │  • Daily material mappings                          │    │
│  │  • Material metadata (rarity, names)                │    │
│  │  • Domain information                               │    │
│  └─────────────────┬───────────────────────────────────┘    │
│                    │ reads                                   │
│                    ▼                                          │
│  ┌─────────────────────────────────────────────────────┐    │
│  │           SQLite Database (Drift)                   │    │
│  │  • BookmarkTable                                    │    │
│  │  • BookmarkMaterialDetailsTable                     │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                               │
└───────────────────────────────────────────────────────────────┘
```

## Efficiency Score Calculation

```
For each domain:
    score = 0
    materials = []
    
    For each material in domain:
        quantity = sum of bookmarked quantities
        
        if quantity > 0:
            rarity = material.rarity
            weightedScore = quantity × (rarity / 5.0)
            
            score += weightedScore
            materials.add({
                id: material.id
                name: material.name
                quantity: quantity
                rarity: rarity
                weightedScore: weightedScore
            })
    
    if materials.isNotEmpty:
        domains.add({
            name: domain.name
            score: score
            materials: materials
            totalQuantity: sum(materials.quantity)
            availableToday: checkAvailability(domain, currentDay)
        })

Sort domains by score (descending)
Return sorted domains
```

## State Management

```
┌────────────────────────────────────────────────┐
│         App State (Riverpod)                   │
│                                                │
│  farmingEfficiencyAnalysisProvider             │
│         │                                      │
│         ├─ AsyncLoading (initial)             │
│         │    └─> Show loading spinner          │
│         │                                      │
│         ├─ AsyncData<FarmingEfficiencyAnalysis>│
│         │    │                                 │
│         │    ├─> totalBookmarks = 0           │
│         │    │    └─> Show "No Bookmarks"      │
│         │    │                                 │
│         │    └─> totalBookmarks > 0           │
│         │         └─> Show analysis results    │
│         │                                      │
│         └─ AsyncError                          │
│              └─> Show error message            │
│                                                │
└────────────────────────────────────────────────┘
```

## Example Calculation

```
Input Bookmarks:
  Character "Hu Tao": 
    - Nectar of Diligence (3★) × 18
    - Guide to Diligence (4★) × 12
    - Philosophies of Diligence (5★) × 3
  
  Character "Zhongli":
    - Nectar of Gold (3★) × 18
    - Guide to Gold (4★) × 12
    
  Weapon "Staff of Homa":
    - Grain of Aerosiderite (2★) × 15
    - Piece of Aerosiderite (3★) × 12

Analysis:
  Domain: "Taishan Mansion" (Diligence materials)
    - Nectar (3★) × 18 → 18 × 0.6 = 10.8
    - Guide (4★) × 12 → 12 × 0.8 = 9.6
    - Philosophies (5★) × 3 → 3 × 1.0 = 3.0
    Efficiency Score: 23.4
    Available: Monday/Thursday/Sunday
  
  Domain: "Taishan Mansion" (Gold materials)
    - Nectar (3★) × 18 → 18 × 0.6 = 10.8
    - Guide (4★) × 12 → 12 × 0.8 = 9.6
    Efficiency Score: 20.4
    Available: Monday/Thursday/Sunday
  
  Domain: "Hidden Palace of Lianshan" (Aerosiderite)
    - Grain (2★) × 15 → 15 × 0.4 = 6.0
    - Piece (3★) × 12 → 12 × 0.6 = 7.2
    Efficiency Score: 13.2
    Available: Tuesday/Friday/Sunday

Sorted Results:
  1. Taishan Mansion (Diligence) - Score: 23.4 ⭐
  2. Taishan Mansion (Gold) - Score: 20.4
  3. Hidden Palace (Aerosiderite) - Score: 13.2
```

## UI Component Tree

```
FarmingEfficiencyPage
├── Scaffold
│   ├── AppBar
│   │   └── Title: "Farming Efficiency Analyzer"
│   └── Body
│       └── AsyncBuilder (farmingEfficiencyAnalysisProvider)
│           ├── Loading State
│           │   └── CircularProgressIndicator
│           ├── Empty State (totalBookmarks = 0)
│           │   └── _NoBookmarksWidget
│           │       ├── Icon (bookmark_add)
│           │       ├── Title text
│           │       └── Description text
│           ├── Data State
│           │   └── _FarmingEfficiencyContent
│           │       ├── Analysis Summary Card
│           │       │   ├── Icon (analytics)
│           │       │   ├── Description
│           │       │   └── Timestamp
│           │       ├── Talent Domains Section
│           │       │   ├── SectionHeading
│           │       │   └── List of _DomainCard
│           │       │       ├── Domain name + availability badge
│           │       │       ├── Efficiency score + total quantity
│           │       │       ├── Divider
│           │       │       └── Material chips
│           │       │           └── _MaterialChip (for each material)
│           │       │               ├── Rarity avatar
│           │       │               └── Name + quantity
│           │       └── Weapon Domains Section
│           │           └── (same structure as Talent)
│           └── Error State
│               └── CenterText with error message
```

---

This flow diagram provides a comprehensive view of how the Farming Efficiency Analyzer works from user interaction to data processing and display.
