import 'package:chat_bot_app/core/networking/api_client.dart';
import 'package:chat_bot_app/core/networking/dio_factory.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo_impl.dart';
import 'package:chat_bot_app/features/chat/data/services/chat_service.dart';
import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt  = GetIt.instance;

Future<void> setupGeIt() async {

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio));
  getIt.registerLazySingleton<ChatService>(() => ChatService(getIt<ApiClient>()));
  getIt.registerLazySingleton<ChatRepoImpl>(() => ChatRepoImpl(chatService: getIt<ChatService>()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt<ChatRepo>()));




}