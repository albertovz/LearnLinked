import 'dart:convert';

Institution institutionFromJson(String str) => Institution.fromJson(json.decode(str));

String institutionToJson(Institution data) => json.encode(data.toJson());

class Institution {
    String id;
    String name;
    String educationLevel;
    String term;

    Institution({
        required this.id,
        required this.name,
        required this.educationLevel,
        required this.term,
    });

    factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        id: json["id"],
        name: json["name"],
        educationLevel: json["educationLevel"],
        term: json["term"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "educationLevel": educationLevel,
        "term": term,
    };
}
