// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/settings_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/utility/app_bloc_observer.dart';
import 'package:flutter_bloc_concepts/presentation/router/app_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext myAppContext) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetCubitContext) =>
              InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (counterCubitContext) => CounterCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (settingsCubitContext) => SettingsCubit(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
