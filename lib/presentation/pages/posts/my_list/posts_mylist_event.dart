import 'package:flutter/foundation.dart';
import 'package:learn_linked/src/domain/models/post.dart';
import 'package:learn_linked/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:learn_linked/src/domain/use_cases/posts/posts_usecases.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';

class PostsMyListEvent extends ChangeNotifier {
  PostsUseCases _postsUseCases;
  AuthUseCases _authUseCases;

  PostsMyListEvent(this._authUseCases, this._postsUseCases);

  Stream<Resource<List<Post>>> getPostsById() {
    String idUser = _authUseCases.getUser.userSession?.uid ?? '';
    return _postsUseCases.getPostsById.launch(idUser);
  }

  deletePost(String idPost) async {
    await _postsUseCases.delete.launch(idPost);
    notifyListeners();
  }
}
