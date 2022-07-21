import 'package:auto_route/auto_route.dart';
import 'package:blocapi/bloc/game_data_bloc.dart';
import 'package:blocapi/cubit/tema_cubit.dart';
import 'package:blocapi/models/data_model.dart';
import 'package:blocapi/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_4),
            onPressed: () => context.read<TemaCubit>().changeTheme(),
          )
        ],
        title: const Text(
          'Game List',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is GameDataLoadedState) {
            return Center(
              child: buildMyWidget(state.apiListe, context),
            );
          }

          return const Center(
            child: Text('Hata Hata'),
          );
        },
      ),
    );
  }

  Widget buildMyWidget(List<DataModel> apiListe, BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: apiListe.length,
      itemBuilder: (BuildContext context, int index) {
        final DataModel dataModel = apiListe[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/detail', arguments: dataModel);
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: NetworkImage(apiListe[index].image),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GlassmorphicContainer(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      border: 0,
                      borderRadius: 0,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.1),
                            const Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: const [
                            0.1,
                            1
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                apiListe[index].title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Platforms' + apiListe[index].platforms,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
