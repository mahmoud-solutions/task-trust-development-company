import 'package:go_router/go_router.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/cart_screens.dart';
import 'package:trustdeveopmenttask/features/navigation%20bar/naviagation_bar.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/prodact_details_screens.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';
import 'package:trustdeveopmenttask/features/product/presention/screens/product_screen.dart';

class AppRouter {
  static const productScreen = '/productScreen';
  static const cartScreen = '/cartScreen';
  static const prodactDetailsScreen = '/prodactDetailsScreenScreen';

  static const layout = '/';

  static final routes = GoRouter(
    initialLocation: productScreen,
    routes: [
      GoRoute(
        path: layout,
        builder: (context, state) => const NavigationBarr(),
      ),
      GoRoute(
        path: prodactDetailsScreen,
        builder: (context, state) => ProdactDetailsScreen(
          productEntity: state.extra as ProductEntity,
        ),
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: productScreen,
        builder: (context, state) => const ProductPage(),
      ),
    ],
  );
}
