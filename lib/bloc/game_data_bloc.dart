import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:blocapi/models/data_model.dart';
import 'package:blocapi/repository/games_repo.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GamesRepo gamesRepo;
  GameDataBloc({required this.gamesRepo}) : super(GameDataInitialState()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLoadingState());
        List<DataModel>? liste = await gamesRepo.getData();
        if (liste == null) {
          emit(GameDataError(error: 'interet hatası'));
        } else {
          emit(GameDataLoadedState(apiListe: liste));
        }
      }
    });
  }
}
