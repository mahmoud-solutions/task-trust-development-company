// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:trustdeveopmenttask/features/prodact%20details%20screenn%20-%20Copy/prodact_details_screens.dart';

// void main() {
//   runApp(DevicePreview(enabled: true, builder: (context) => const MyTestApp()));
// }

// class MyTestApp extends StatelessWidget {
//   const MyTestApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       useInheritedMediaQuery: true,
//       debugShowCheckedModeBanner: false,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       home: ProdactDetailsScreen(
//         productId: 123,
//       ),
//     );
//   }
// }

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/core/routing/app_router.dart';
import 'package:trustdeveopmenttask/core/services/service_locator.dart';
import 'package:trustdeveopmenttask/core/services/shered_prefs.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_cubit.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/GetCartCubit/cubit/cart_cubit.dart';
import 'package:trustdeveopmenttask/features/product/presention/cubit/gest_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await init();
  runApp(
      DevicePreview(enabled: false, builder: (context) => const MyTestApp()));
}

class MyTestApp extends StatelessWidget {
  const MyTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GuestIdCubit>()..loadGuestId(),
        ),
        BlocProvider(
          create: (context) => sl<AddTOCartCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<CartCubit>(),
        ),
      ],
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.routes,
      ),
    );
  }
}
