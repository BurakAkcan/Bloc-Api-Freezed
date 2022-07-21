import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocapi/bloc/game_data_bloc.dart';
import 'package:blocapi/models/data_model.dart';
import 'package:blocapi/repository/games_repo.dart';
import 'package:blocapi/screens/detail_page.dart';
import 'package:blocapi/screens/landing_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => LandingPage(),
        );

      case '/detail':
        final data = settings.arguments as DataModel;
        return MaterialPageRoute(
          builder: (context) => DetailPage(dataModel: data),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}

class AppRouter2 {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => LandingPage(),
        );

      case 'detail':
        final data = settings.arguments as DataModel;
        return MaterialPageRoute(
          builder: (context) => DetailPage(dataModel: data),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}
