import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trustdeveopmenttask/core/routing/app_router.dart';

class NavigationBarr extends StatelessWidget {
  const NavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: 90,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.person, color: Colors.teal),
                    Icon(Icons.local_offer),
                    SizedBox(width: 60),
                    Icon(Icons.menu_book),
                    Icon(Icons.home),
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                height: 55,
                width: 55,
                decoration: const BoxDecoration(
                  color: Color(0xff5117AC),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                    onPressed: () =>
                        GoRouter.of(context).push(AppRouter.cartScreen),
                    icon: Icon(
                      Icons.shopping_basket,
                      color: Colors.white,
                      size: 28,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
