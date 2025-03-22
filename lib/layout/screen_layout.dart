// import 'package:flutter/material.dart';
// import 'package:mevivu_recipe_app/screens/home_screen.dart';
// import 'package:mevivu_recipe_app/utils/color_themes.dart';

// class ScreenLayout extends StatefulWidget {
//   @override
//   _ScreenLayoutState createState() => _ScreenLayoutState();
// }

// class _ScreenLayoutState extends State<ScreenLayout> {
//   int _selectedIndex = 0;
//   void _setBottomBarIndex(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: [
//           HomeScreen(),
//           Center(child: Text("Search Screen")),
//           Center(child: Text("Save Screen")),
//           Center(child: Text("Personal Screen")),
//         ],
//       ),

//       bottomNavigationBar: Stack(
//         children: [
//           Positioned(
//             bottom: 0,
//             left: 0,
//             child: Container(
//               width: size.width,
//               height: 80,
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   CustomPaint(
//                     size: Size(size.width, 80),
//                     painter: BNBCustomPainter(),
//                   ),
//                   Positioned(
//                       top: -30, // Move the floating button upward
//                       left: size.width / 2 - 30,
//                       child: FloatingActionButton(
//                         shape: const CircleBorder(),
//                         backgroundColor:
//                             Colors.transparent, // Make FAB transparent
//                         elevation: 0.1,
//                         onPressed: () {},
//                         child: Container(
//                           width: 56, // Default FAB size
//                           height: 56,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 primaryColor.shade600,
//                                 primaryColor.shade500,
//                               ],
//                             ),
//                           ),
//                           child: const Icon(Icons.add,
//                               size: 36, color: Colors.white),
//                         ),
//                       )),
//                   SizedBox(
//                     width: size.width,
//                     height: 80,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.home, size: 30),
//                           color: _selectedIndex == 0
//                               ? primaryColor.shade600
//                               : neutralColor.shade300,
//                           onPressed: () => _setBottomBarIndex(0),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.search, size: 30),
//                           color: _selectedIndex == 1
//                               ? primaryColor.shade600
//                               : neutralColor.shade300,
//                           onPressed: () => _setBottomBarIndex(1),
//                         ),
//                         SizedBox(
//                             width: size.width *
//                                 0.20), // Space for the floating button
//                         IconButton(
//                           icon: Icon(Icons.bookmark_outlined, size: 30),
//                           color: _selectedIndex == 2
//                               ? primaryColor.shade600
//                               : neutralColor.shade300,
//                           onPressed: () => _setBottomBarIndex(2),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.person_2_outlined, size: 30),
//                           color: _selectedIndex == 3
//                               ? primaryColor.shade600
//                               : neutralColor.shade300,
//                           onPressed: () => _setBottomBarIndex(3),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, 0); // Start with a straight line
//     path.lineTo(size.width * 0.40, 0);
//     path.arcToPoint(
//       Offset(size.width * 0.60, 0),
//       radius: Radius.circular(30.0),
//       clockwise: false,
//     );
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawShadow(path, Colors.black26, 5, true);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
//**************************************************** */
// import 'package:flutter/material.dart';
// import 'package:mevivu_recipe_app/screens/home_screen.dart';
// import 'package:mevivu_recipe_app/utils/color_themes.dart';

// class ScreenLayout extends StatefulWidget {
//   @override
//   _ScreenLayoutState createState() => _ScreenLayoutState();
// }

// class _ScreenLayoutState extends State<ScreenLayout> {
//   int _selectedIndex = 0;

//   void _setBottomBarIndex(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: IndexedStack(
//           index: _selectedIndex,
//           children: [
//             HomeScreen(),
//             Center(child: Text("Search Screen")),
//             Center(child: Text("Save Screen")),
//             Center(child: Text("Personal Screen")),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 80,
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             // Custom painter for the concave effect
//             CustomPaint(
//               size: Size(size.width, 80),
//               painter: BNBCustomPainter(),
//             ),
//             // Floating Action Button
//             Positioned(
//               top: -30, // Move the floating button upward
//               left: size.width / 2 - 30,
//               child: FloatingActionButton(
//                 shape: const CircleBorder(),
//                 backgroundColor: Colors.transparent, // Make FAB transparent
//                 elevation: 0.1,
//                 onPressed: () {},
//                 child: Container(
//                   width: 56, // Default FAB size
//                   height: 56,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         primaryColor.shade600,
//                         primaryColor.shade500,
//                       ],
//                     ),
//                   ),
//                   child: const Icon(Icons.add, size: 36, color: Colors.white),
//                 ),
//               ),
//             ),
//             // Bottom Navigation Icons
//             SizedBox(
//               width: size.width,
//               height: 80,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.home, size: 30),
//                     color: _selectedIndex == 0
//                         ? primaryColor.shade600
//                         : neutralColor.shade300,
//                     onPressed: () => _setBottomBarIndex(0),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.search, size: 30),
//                     color: _selectedIndex == 1
//                         ? primaryColor.shade600
//                         : neutralColor.shade300,
//                     onPressed: () => _setBottomBarIndex(1),
//                   ),
//                   SizedBox(width: size.width * 0.20), // Space for FAB
//                   IconButton(
//                     icon: Icon(Icons.bookmark_outlined, size: 30),
//                     color: _selectedIndex == 2
//                         ? primaryColor.shade600
//                         : neutralColor.shade300,
//                     onPressed: () => _setBottomBarIndex(2),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.person_2_outlined, size: 30),
//                     color: _selectedIndex == 3
//                         ? primaryColor.shade600
//                         : neutralColor.shade300,
//                     onPressed: () => _setBottomBarIndex(3),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, 0); // Start at the top-left corner

//     // Draw a straight line to the start of the concave
//     path.lineTo(size.width * 0.40, 0);

//     // Draw a half-circle for the concave
//     path.arcToPoint(
//       Offset(size.width * 0.60, 0), // End point of the half-circle
//       radius: Radius.circular(20.0), // Radius of the half-circle
//       clockwise: false,
//     );

//     // Draw a straight line to the end of the tab bar
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     // Draw shadow for the tab bar
//     canvas.drawShadow(path, Colors.black26, 5, true);
//     // Draw the path
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/screens/home_screen.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class ScreenLayout extends StatefulWidget {
  @override
  _ScreenLayoutState createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _selectedIndex = 0;

  void _setBottomBarIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: [
              HomeScreen(),
              Center(child: Text("Search Screen")),
              Center(child: Text("Save Screen")),
              Center(child: Text("Personal Screen")),
            ],
          ),

          // Custom Tab Bar
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: BNBCustomClipper(),
              child: Container(
                width: size.width,
                height: 80,
                color: Colors.white, // Set this to match your tab bar background
              ),
            ),
          ),

          // Floating Action Button
          Positioned(
            bottom: 50, // Adjust height so it looks more elevated
            left: size.width / 2 - 30,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.transparent, // Transparent FAB
              elevation: 0.1,
              onPressed: () {},
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryColor.shade600,
                      primaryColor.shade500,
                    ],
                  ),
                ),
                child: const Icon(Icons.add, size: 36, color: Colors.white),
              ),
            ),
          ),

          // Tab Icons
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, size: 30),
                    color: _selectedIndex == 0
                        ? primaryColor.shade600
                        : neutralColor.shade300,
                    onPressed: () => _setBottomBarIndex(0),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, size: 30),
                    color: _selectedIndex == 1
                        ? primaryColor.shade600
                        : neutralColor.shade300,
                    onPressed: () => _setBottomBarIndex(1),
                  ),
                  SizedBox(width: size.width * 0.20), // Space for FAB
                  IconButton(
                    icon: Icon(Icons.bookmark_outlined, size: 30),
                    color: _selectedIndex == 2
                        ? primaryColor.shade600
                        : neutralColor.shade300,
                    onPressed: () => _setBottomBarIndex(2),
                  ),
                  IconButton(
                    icon: Icon(Icons.person_2_outlined, size: 30),
                    color: _selectedIndex == 3
                        ? primaryColor.shade600
                        : neutralColor.shade300,
                    onPressed: () => _setBottomBarIndex(3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ **Step 2: Create Transparent Concave Using `ClipPath`**
class BNBCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.4, 0);
    path.arcToPoint(
      Offset(size.width * 0.6, 0),
      radius: Radius.circular(30.0),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
