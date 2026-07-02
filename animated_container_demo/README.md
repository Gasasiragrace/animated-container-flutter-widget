# AnimatedContainer Demo — Like Button Product Card

A small Flutter demo built for my Widget Presentation assignment.
It shows off the **AnimatedContainer** widget by turning a plain product
card into a "like" button — similar to the heart animation you see on
Instagram or shopping apps. Instead of manually writing animation
controllers, AnimatedContainer handles the whole transition for us
just by changing values in `setState`.

## What is AnimatedContainer?

It's an implicitly animated version of the regular `Container` widget.
You give it a new width, height, color, etc. inside `setState`, and it
automatically animates from the old values to the new ones — no
`AnimationController`, no `Tween`, no manual ticker setup required.

## How to run it

1. Make sure you have Flutter installed (`flutter --version` to check).
2. Clone this repo:
   ```
   git clone https://github.com/YOUR_USERNAME/animated_container_demo.git
   cd animated_container_demo
   ```
3. Get the packages:
   ```
   flutter pub get
   ```
4. Run it on an emulator, simulator, or connected device:
   ```
   flutter run
   ```
5. Tap the gray box in the middle of the screen. It will smoothly grow,
   turn pink, and become a circle, with the heart icon filling in.
   Tap it again to shrink it back.

## The three attributes I'm demonstrating

| Property | Default if left out | What I set it to | What changes on screen |
|---|---|---|---|
| `duration` | none — it's required, but a careless choice like 50ms would make the change feel instant/jumpy | `Duration(milliseconds: 400)` | How long the grow/shrink and color change takes to finish |
| `curve` | `Curves.linear` (constant speed, feels mechanical) | `Curves.easeInOut` | The pacing of the animation — starts slow, speeds up in the middle, eases out at the end, so it feels natural instead of robotic |
| `width` / `height` | container just hugs its child's size, no fixed box | `220` → `260` (animates between these two) | The actual size of the card grows on screen when you tap it |

I'm also changing `decoration` (color + `borderRadius`) at the same time
just to make the demo feel more like a real "like" interaction, but the
three I'll walk through in detail during the talk are the ones above.

**Why a developer would touch these in real life:**
- `duration` — too short feels glitchy, too long feels sluggish. Tuning
  it is how you make an app feel "snappy" instead of laggy.
- `curve` — using `linear` everywhere is one of the easiest ways to make
  an app feel cheap. `easeInOut` (or similar) is what most production
  apps actually use for UI transitions.
- `width`/`height` — animating size is how apps give feedback that
  something was tapped/selected without needing a separate animation
  widget for every interaction.

## Screenshot

![Card before and after tapping](screenshot.png)

*(Left: default state. Right: after tapping — card grows, turns pink,
and becomes a circle.)*

## Presentation date

In-class presentation date: **[FILL IN THE DATE YOU ACTUALLY PRESENT]**

## Credits

Built from scratch for this assignment using the official Flutter docs
for `AnimatedContainer`: https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html
