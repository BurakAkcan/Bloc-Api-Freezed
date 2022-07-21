part of 'game_data_bloc.dart';

abstract class GameDataState extends Equatable {
  const GameDataState();

  @override
  List<Object> get props => [];
}

class GameDataInitialState extends GameDataState {}

class GameDataLoadingState extends GameDataState {}

class GameDataLoadedState extends GameDataState {
  final List<DataModel> apiListe;

  GameDataLoadedState({required this.apiListe});
}

class GameDataError extends GameDataState {
  final String error;
  GameDataError({
    required this.error,
  });
}
