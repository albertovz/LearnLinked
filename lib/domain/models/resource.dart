import 'dart:convert';

import 'package:learn_linked/src/domain/models/user_data.dart';

ResourceModel postFromJson(String str) => ResourceModel.fromJson(json.decode(str));

String postToJson(ResourceModel data) => json.encode(data.toJson());

class ResourceModel {
    String id;
    String image;
    String name;
    String description;
    String idUser;
    String contentType;
    String category;
    List<String> likes;
    UserData? userData;
    String latitud;
    String longitud;

    ResourceModel({
        this.id = '',
        this.image = '',
        this.name = '',
        this.description = '',
        this.idUser = '',
        this.category = '',
        this.contentType = '',
        this.likes = const [],
        this.userData,
        this.latitud = '',
        this.longitud = ''
    });

    factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        id: json["id"] ?? '',
        image: json["image"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        idUser: json["id_user"] ?? '',
        category: json["category"] ?? '',
        contentType: json["contentType"] ?? '',
        likes: json["likes"] != null ? List.from(json["likes"] )  : [],
        latitud: json["latitud"] ?? '',
        longitud: json["longitud"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "description": description,
        "contentType": contentType,
        "id_user": idUser,
        "category": category,
        "likes": likes,
        "latitud": latitud,
        "longitud": longitud
    };
}

