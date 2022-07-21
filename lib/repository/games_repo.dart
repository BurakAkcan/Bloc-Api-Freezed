import 'dart:convert';

import 'package:blocapi/constants/string_constant.dart';
import 'package:blocapi/models/data_model.dart';
import 'package:http/http.dart' as http;

class GamesRepo {
  Future<List<DataModel>?> getGamesData() async {
    final result = await http.Client().get(Uri.parse(baseUrl));
    if (result.statusCode != 200) {
      return null;
    } else {
      Iterable models = jsonDecode(result.body);
      List<DataModel> dataModelsList = [];
      for (var model in models) {
        DataModel dataModel = DataModel.fromJson(model);
        dataModelsList.add(dataModel);
      }
      print(dataModelsList);
      return dataModelsList;
    }
  }

  Future<List<DataModel>?> getData() async {
    http.Response response = await http.Client().get(Uri.parse(baseUrl));
    if (response.statusCode != 200) {
      return null;
    } else {
      var data = jsonDecode(response.body) as List<dynamic>;
      List<DataModel>? listem = data
          .map(
            (e) => DataModel.fromJson(e),
          )
          .toList();
      return listem;
    }
  }
}
