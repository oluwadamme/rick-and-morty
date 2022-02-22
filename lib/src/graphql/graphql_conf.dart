import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GQLConfiguration {
  static HttpLink httpLink =
      HttpLink("https://rickandmortyapi.com/graphql");

  String? typenameDataIdFromObject(Object object) {
    if (object is Map<String, Object> &&
        object.containsKey('__typename') &&
        object.containsKey('id')) {
      return "${object['__typename']}/${object['id']}";
    }
    return null;
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
          //store: HiveStore(),
          dataIdFromObject: (Object object) {
            if (object is Map<String, Object> &&
                object.containsKey('__typename') &&
                object.containsKey('id')) {
              return "${object['__typename']}/${object['id']}";
            }
            return null;
          }),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(
          //store: HiveStore(),
           dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}
