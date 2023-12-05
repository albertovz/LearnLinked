import 'package:learn_linked/src/domain/repository/posts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeletePostUseCase {

  PostsRepository _repository;

  DeletePostUseCase(this._repository);

  launch(String idPost) => _repository.delete(idPost);

}