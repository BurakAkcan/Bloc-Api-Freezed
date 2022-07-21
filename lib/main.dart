import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocapi/bloc/game_data_bloc.dart';
import 'package:blocapi/cubit/tema_cubit.dart';
import 'package:blocapi/repository/games_repo.dart';
import 'package:blocapi/routes/app_router.dart';
import 'package:blocapi/screens/landing_page.dart';

void main() => runApp(BlocProvider<GameDataBloc>(
      create: (context) => GameDataBloc(
        gamesRepo: GamesRepo(),
      ),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ));

class MyApp extends StatelessWidget {
  AppRouter appRouter;
  MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TemaCubit(),
      child: BlocBuilder<TemaCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            onGenerateRoute: appRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            theme: state,
            title: 'Material App',
            home: const LandingPage(),
          );
        },
      ),
    );
  }
}
