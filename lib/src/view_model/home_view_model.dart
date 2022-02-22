import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rickandmorty/src/graphql/graphql_conf.dart';
import 'package:rickandmorty/src/graphql/graphql_query.dart';
import 'package:rickandmorty/src/models/character.dart';
import 'package:rickandmorty/src/view_model/info_model.dart';

class HomeViewModel with ChangeNotifier {
  GQLConfiguration gqlConfiguration = GQLConfiguration();
  GraphQLQuery graphQLQuery = GraphQLQuery();
  List<CharacterModel> result = [];
  InfoModel? _info;
  InfoModel? get info => _info;

  Future getCharacter({int? page}) async {
    GraphQLClient _client = gqlConfiguration.clientToQuery();
    QueryResult res = await _client.query(
      QueryOptions(document: gql(graphQLQuery.getCharacter(page: page))),
    );
    if (res.hasException) {
      result = [];
      notifyListeners();
    } else {
      _info=InfoModel.fromJson(res.data!["characters"]["info"]);
      for (var item in res.data!["characters"]["results"]) {
        result.add(CharacterModel.fromJson(item));
      }
      notifyListeners();
    }
    return result;
  }
}
