import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/addToCart/add_to_cart_usecase.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/ensure_guest_session_use_case.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/get_cart.dart/get_cart.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_cubit.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/GetCartCubit/cubit/cart_cubit.dart';
import 'package:trustdeveopmenttask/features/product/presention/cubit/gest_cubit.dart';
import '../services/api_services.dart';
import '../../features/product/data/data%20source/product_remote_data_source.dart';
import '../../features/product/data/repo%20impl/product_repo_impl.dart';
import '../../features/product/domain/usecase/get_broduct_details_usecas.dart';
import '../../features/product/domain/usecase/get_category_usecase.dart';
import '../../features/product/domain/usecase/get_product_by_category.dart';
import '../../features/product/domain/usecase/get_product_adons_usecase.dart';
import '../../features/product/presention/productCubit/product_cubit.dart';
import '../../features/product/presention/productDetailsCubit/cubit/product_details_cubit.dart';
import '../../features/product/presention/AdonsCubit/cubit/addon_cubit_cubit.dart';
import '../../features/product/domain/category repo/repo_product_and_category.dart';
import '../../features/cart screen/data/LocalDataSource/GuestLocalDataSource/guest_local_data_source.dart';
import '../../features/cart screen/data/RemoteDataSource/guestRemoteDataSource/cart_remote_data_source.dart';
import '../../features/cart screen/data/repo/cart_repo_implimition.dart';
import '../../features/cart screen/domain/repo/cart_repo.dart';
import '../../features/cart screen/domain/UseCase/get guest/get_guest_id.dart';
import '../../features/cart screen/presention/guesCubit/guest_cubit_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<GetCategoriesUseCse>(
      () => GetCategoriesUseCse(sl()));
  sl.registerLazySingleton<GetProductsByCategory>(
      () => GetProductsByCategory(sl()));
  sl.registerLazySingleton<GetProductDetailsUseCase>(
      () => GetProductDetailsUseCase(sl()));
  sl.registerLazySingleton<GetProductAddonsUseCase>(
      () => GetProductAddonsUseCase(sl()));
  sl.registerFactory<ProductCubit>(
    () => ProductCubit(
      getCategories: sl<GetCategoriesUseCse>(),
      getProductsByCategoryUseCase: sl<GetProductsByCategory>(),
    ),
  );
  sl.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(sl()));
  sl.registerFactory<AddonCubit>(() => AddonCubit(sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<GuestLocalDataSource>(
      () => GuestLocalDataSourceImpl());
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ));
  sl.registerLazySingleton<GetGuestIdUseCase>(() => GetGuestIdUseCase(sl()));
  sl.registerFactory<GuestCubit>(() => GuestCubit(sl()));
  sl.registerLazySingleton<GuestIdCubit>(() => GuestIdCubit(sl()));
  sl.registerLazySingleton<GetCartUseCase>(() => GetCartUseCase(sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(sl()));
  sl.registerLazySingleton<AddProductToCartUseCase>(
      () => AddProductToCartUseCase(sl()));
  sl.registerLazySingleton<EnsureGuestSessionUseCase>(
      () => EnsureGuestSessionUseCase(sl()));
  sl.registerFactory<AddTOCartCubit>(
    () => AddTOCartCubit(
      sl<AddProductToCartUseCase>(),
      sl<EnsureGuestSessionUseCase>(),
    ),
  );
}
