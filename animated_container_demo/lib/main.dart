import 'package:flutter/material.dart';

// Entry point of the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedContainer Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ProductCardScreen(),
    );
  }
}

// This screen holds our demo: a product card that the user can "like".
// Liking it changes the card's size, color, and corner roundness
// all at once, and AnimatedContainer animates between those states for us.
class ProductCardScreen extends StatefulWidget {
  const ProductCardScreen({super.key});

  @override
  State<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  // This bool is the only thing we need to track.
  // AnimatedContainer reads this value and animates to match it
  // whenever it changes -- we never write animation code ourselves.
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer Demo'),
      ),
      body: Center(
        child: GestureDetector(
          // Tapping the card toggles the liked state
          onTap: toggleLike,
          child: AnimatedContainer(
            // ---- PROPERTY 1: duration ----
            // Controls how long the animation takes to finish.
            // Default if you skip it: there is no default, it's required,
            // but a "boring" value would be something tiny like 100ms.
            // Here we use 400ms so the change is smooth and visible,
            // not instant and not sluggish.
            duration: const Duration(milliseconds: 400),

            // ---- PROPERTY 2: curve ----
            // Controls the "feel" / pacing of the animation over its
            // duration. Default value if omitted is Curves.linear
            // (constant speed, feels robotic).
            // We use Curves.easeInOut so it starts slow, speeds up,
            // then slows down again -- feels more natural, like a
            // real app transition.
            curve: Curves.easeInOut,

            // ---- PROPERTY 3: width & height (size) ----
            // These control how big the box is on screen.
            // Default width/height if omitted: the container just
            // shrinks to fit its child instead of having a fixed size.
            // We grow the card when liked so the user gets a clear
            // visual reward for liking it.
            width: isLiked ? 260 : 220,
            height: isLiked ? 260 : 220,

            // decoration lets us change color AND corner roundness
            // together. This is a 4th nice-to-show property, but we
            // will focus our spoken explanation on the 3 above plus
            // mention this as a bonus during the live demo.
            decoration: BoxDecoration(
              color: isLiked ? Colors.pinkAccent : Colors.grey[300],
              borderRadius: BorderRadius.circular(isLiked ? 130 : 16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            // The child stays the same heart icon and label;
            // AnimatedContainer only animates the box around it.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: 60,
                ),
                const SizedBox(height: 12),
                Text(
                  isLiked ? 'Liked!' : 'Tap to like',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
