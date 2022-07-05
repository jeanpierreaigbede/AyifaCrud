
class DataModel {

  final int id ;
  final String titre ;
  final String contenu ;
  final String created_at ;

  DataModel({ required this.id ,required this.titre ,required this.contenu, required this.created_at });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(
        id: json['id'] ?? "",
        titre: json["titre"] ?? "",
        contenu: json['contenu'] ?? "",
        created_at: json['created_at'] ?? ""
    );
  }

}