import 'package:chat_bot_app/core/networking/api_services.dart';
import 'package:chat_bot_app/core/networking/dio_factory.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo.dart';
import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final getIt  = GetIt.instance;


Future<void> setupGeIt() async {

  // Core Services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt<ApiServices>()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt<ChatRepo>()));




}