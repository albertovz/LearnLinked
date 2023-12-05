// import 'package:flutter/foundation.dart';
// import 'package:learn_linked/src/domain/models/post.dart';
// import 'package:learn_linked/src/domain/models/resource.dart';
// import 'package:learn_linked/src/domain/models/user_data.dart';
// import 'package:learn_linked/src/domain/use_cases/auth/auth_usecases.dart';
// import 'package:learn_linked/src/domain/use_cases/resources/posts_usecases.dart';
// import 'package:learn_linked/src/domain/use_cases/users/users_usecases.dart';
// import 'package:learn_linked/src/domain/utils/resource.dart';

// class PostsResourceListEvent extends ChangeNotifier {
//   PostsResourceUseCases _postsResourceUseCases;
//   AuthUseCases _authUseCases;
//   UsersUseCase _usersUseCase;
//   String _id = '';
//   String get id => _id;

//   PostsResourceListEvent(this._authUseCases, this._postsResourceUseCases, this._usersUseCase) {
//     _id = _authUseCases.getUser.userSession?.uid ?? '';
//   }

//   Stream<Resource<List<ResourceModel>>> getPosts() => _postsResourceUseCases.getPosts.launch();

//   Future<UserData> getUserInfo (String idUser) => _usersUseCase.getUserByIdOnce.launch(idUser);

//   like(String idPost) async {
//     await _postsResourceUseCases.like.launch(idPost, id);
//   }

//   deleteLike(String idPost) async {
//     await _postsResourceUseCases.deleteLike.launch(idPost, id);
//   }

// }
