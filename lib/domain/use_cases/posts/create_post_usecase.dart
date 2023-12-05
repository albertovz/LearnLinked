import 'dart:io';

import 'package:learn_linked/src/domain/models/post.dart';
import 'package:learn_linked/src/domain/repository/posts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreatePostUSeCase {

  PostsRepository _repository;

  CreatePostUSeCase(this._repository);

  launch(Post post, File image) => _repository.create(post, image);

}