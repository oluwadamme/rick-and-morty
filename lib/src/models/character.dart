class CharacterModel {
  final String id;
  final String image;
  final String name;
  final String species;
  final String status;
  final String gender;

  CharacterModel( 
      {required this.id,required this.image, required this.name, required this.species, required this.status, required this.gender});
  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        gender: json["gender"],
        image: json["image"],
       
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
       
        "gender": gender,
        "image": image,
        
      };
}
