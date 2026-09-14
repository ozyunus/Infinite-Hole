# Infinite Hole --- Project Brief & Definition of Done

## 1. Project Goal

The primary goal of this project is **not revenue, growth, or
product-market fit**.

The challenge is:

> Build a small but real mobile game from start to finish and
> successfully submit it to Apple App Review.

### Success criterion

**Submitted for Review ✅**

Apple approval/publication is outside the scope of the challenge because
review time is controlled by Apple.

------------------------------------------------------------------------

## 2. Core Product

### Working title

**Infinite Hole**

### Core mechanic

Objects fall from the top of the screen.

The player moves a **hole** horizontally with their finger.

The goal is to catch the falling objects with the hole.

### Initial game loop

1.  Open app
2.  Tap Play
3.  Objects start falling
4.  Player moves the hole
5.  Catch objects
6.  Score increases
7.  Missing an object ends the game
8.  Show score and best score
9.  Play Again

The first version should be intentionally minimal.

------------------------------------------------------------------------

## 3. Future Product Direction: Geometric Pattern Discovery

After the basic game is shipped, the game can evolve into a combination
of:

-   casual reflex game
-   geometric pattern collection
-   cultural discovery

The player will progressively encounter different geometric forms and
patterns.

Examples may include:

-   basic geometric shapes
-   Islamic geometric patterns
-   Ismaili-related geometric motifs
-   Celtic knots
-   Flower of Life
-   Metatron's Cube
-   Penrose-style forms
-   other culturally or mathematically interesting patterns

### Important implementation decision

**SetGreet will handle the introduction/education experience.**

When a new pattern is about to be introduced:

1.  The game detects that the player is entering the relevant
    level/content.
2.  The app triggers the SetGreet SDK.
3.  SetGreet displays the short introduction/explanation.
4.  The player continues.
5.  The new geometric object/pattern becomes part of the game.

Therefore:

> **We do NOT build an in-app educational/introduction screen.**

There is no need for a custom "New Pattern Unlocked" information UI
inside Infinite Hole if SetGreet is handling it.

### SetGreet integration

The intended architecture is:

`Infinite Hole → SetGreet SDK → introduction → return to game/next level`

The SDK should be integrated at the appropriate level/event boundary and
triggered before the relevant level/content begins.

The exact SDK integration details should be handled during
implementation based on the current SetGreet SDK/API documentation.

------------------------------------------------------------------------

## 4. Version 1.0 Scope

### Home

Minimal home screen:

-   Infinite Hole title
-   Play button
-   Best score

### Game

-   Falling objects
-   Movable hole
-   Collision/catch detection
-   Score
-   Game over condition

### Game Over

-   Game Over
-   Current score
-   Best score
-   Play Again
-   Home

### Persistence

Only local best score is required.

No account or server.

------------------------------------------------------------------------

## 5. Version 1.0 --- Definition of Done

### Game functionality

-   [ ] Xcode project created
-   [ ] App launches successfully
-   [ ] Home screen works
-   [ ] Play starts a game
-   [ ] Hole can be moved with touch
-   [ ] Falling objects spawn
-   [ ] Objects move downward
-   [ ] Collision/catch detection works
-   [ ] Caught object disappears
-   [ ] Score increases
-   [ ] Missing an object triggers Game Over
-   [ ] Current score is shown
-   [ ] Best score is saved locally
-   [ ] Play Again works
-   [ ] Home works

### Device quality

-   [ ] Works in iPhone Simulator
-   [ ] Tested on a real iPhone if available
-   [ ] No known crash
-   [ ] No obvious gameplay-breaking bug
-   [ ] Basic performance is acceptable

### Visual quality

-   [ ] App icon
-   [ ] Consistent visual theme
-   [ ] Play button
-   [ ] Game UI
-   [ ] Score UI
-   [ ] Game Over UI
-   [ ] Basic animation/polish

Simple geometric visuals are preferred.

Do not spend hours searching for external assets.

### App Store / Apple

-   [ ] Apple Developer account ready
-   [ ] Bundle ID configured
-   [ ] Signing configured
-   [ ] App created in App Store Connect
-   [ ] App name
-   [ ] Subtitle
-   [ ] Description
-   [ ] Keywords
-   [ ] Category
-   [ ] Age rating
-   [ ] Support URL
-   [ ] Privacy Policy URL
-   [ ] App Privacy information
-   [ ] Review Information
-   [ ] Required export/compliance questions completed
-   [ ] App Store screenshots
-   [ ] Version 1.0 configured
-   [ ] Archive created
-   [ ] Build validated
-   [ ] Build uploaded
-   [ ] Build processed successfully
-   [ ] Build selected for submission
-   [ ] **Submit for Review**

------------------------------------------------------------------------

## 6. Things Explicitly OUT OF SCOPE for v1.0

Do NOT add these before App Review submission:

-   [ ] Multiplayer
-   [ ] Online leaderboard
-   [ ] Game Center
-   [ ] Achievements
-   [ ] Ads
-   [ ] In-App Purchases
-   [ ] Subscription
-   [ ] Login/account system
-   [ ] Backend
-   [ ] CloudKit
-   [ ] AI
-   [ ] AR
-   [ ] Push notifications
-   [ ] Complex tutorial
-   [ ] Skins
-   [ ] Shop
-   [ ] In-game currency
-   [ ] Multiple game modes
-   [ ] Large level system
-   [ ] Complex obstacle system
-   [ ] Educational content system inside the app

These can become future backlog items.

------------------------------------------------------------------------

## 7. Future Roadmap

### v1.1 --- Pattern Discovery

Introduce the first special geometric patterns.

For each pattern:

-   Pattern asset
-   Pattern name
-   Unlock/level condition
-   SetGreet introduction
-   Pattern becomes a playable falling object

The introduction itself is handled by SetGreet, not by Infinite Hole UI.

### v1.2 --- Pattern Collection

Add an in-app collection/book showing discovered patterns.

Possible information:

-   Pattern name
-   Discovery status
-   Short metadata
-   Cultural/mathematical category

### v1.3 --- Gameplay Expansion

Possible additions:

-   Different object types
-   Increasing difficulty
-   Speed progression
-   Combo system
-   Special objects
-   Haptic feedback
-   Sound
-   Better animations

### v1.4+

Possible additions:

-   Daily challenge
-   Game Center leaderboard
-   Achievements
-   Themes
-   Additional pattern families
-   More complex game modes

------------------------------------------------------------------------

## 8. Product Identity

The long-term concept is:

> **A simple reflex game where players discover the world's geometric
> patterns.**

Possible positioning:

**INFINITE HOLE**

> Catch. Discover. Learn.

The game should remain fun even without the educational layer.

The geometric discovery layer is what gives the game its distinctive
identity.

------------------------------------------------------------------------

## 9. Development Rules for This Project

### Rule 1 --- Ship first

The first objective is to complete the full pipeline once.

### Rule 2 --- No scope creep

If a new idea appears during development:

> Put it in the backlog. Do not implement it in v1.0.

### Rule 3 --- No premature optimization

Do not build systems for future features before they are necessary.

### Rule 4 --- No monetization pressure

Revenue is not part of the v1.0 success criterion.

### Rule 5 --- No AI

The first version deliberately contains no AI or external AI API.

### Rule 6 --- Minimize dependencies

Prefer native iOS/Swift/SwiftUI functionality.

SetGreet is the only planned external SDK because it is part of the
future product direction and will be integrated at the appropriate
point.

### Rule 7 --- Definition of Done wins

When deciding whether to work on something, ask:

> Does this help us reach **Submitted for Review**?

If not, defer it.

------------------------------------------------------------------------

## 10. Today's Target

By the end of the working session:

**Infinite Hole v1.0**

should be:

`Implemented → Tested → Archived → Uploaded → App Store Connect configured → Submitted for Review`

The project is successful even if:

-   it gets zero downloads,
-   nobody plays it,
-   Apple requests changes,
-   the game is not commercially successful.

The immediate objective is to prove:

> **We can take a mobile product from zero to App Store Review.**
