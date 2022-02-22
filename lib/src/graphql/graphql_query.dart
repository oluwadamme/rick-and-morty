class GraphQLQuery {

  String getCharacter({int? page}) {
    return """
      query {
        characters(page: $page) {
          info {
            count
            pages
            next
            prev

          }
          results {
            id
            name
            status
            species
            type
            gender
            image
            created
          }
        }
      }
    """;
  }

}