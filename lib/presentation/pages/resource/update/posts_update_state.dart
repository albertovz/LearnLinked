import 'package:learn_linked/src/domain/models/post.dart';
import 'package:learn_linked/src/presentation/utils/validation_item.dart';

class PostsResourceUpdateState {
  ValidationItem name;
  ValidationItem description;
  String id;
  String image;
  String category;
  String idUser;
  String error;

  PostsResourceUpdateState(
      {this.id = '',
      this.name = const ValidationItem(),
      this.description = const ValidationItem(),
      this.image = '',
      this.category = 'CATEGORIES',
      this.idUser = '',
      this.error = ''});

  Post toPost() => Post(
      id: id,
      name: name.value,
      description: description.value,
      category: category,
      idUser: idUser,
      image: image);

  bool isValid() {
    if (name.value.isEmpty ||
        name.error.isNotEmpty ||
        description.value.isEmpty ||
        description.error.isNotEmpty ||
        image == null ||
        category.isEmpty ||
        idUser.isEmpty) {
      return false;
    }
    return true;
  }

  PostsResourceUpdateState copyWith(
          {ValidationItem? name,
          ValidationItem? description,
          String? image,
          String? category,
          String? idUser,
          String? error,
          String? id}) =>
      PostsResourceUpdateState(
          name: name ?? this.name,
          description: description ?? this.description,
          image: image ?? this.image,
          category: category ?? this.category,
          idUser: idUser ?? this.idUser,
          error: error ?? this.error,
          id: id ?? this.id,);
}
