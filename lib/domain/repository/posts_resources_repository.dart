// import 'dart:io';

// import 'package:learn_linked/src/domain/models/resource.dart';
// import 'package:learn_linked/src/domain/utils/resource.dart';

// abstract class PostsResourceRepository {

//   Future<Resource<String>> create(ResourceModel post, File image);
//   Future<Resource<String>> delete(String idPost);
//   Future<Resource<String>> update(ResourceModel post);
//   Future<Resource<String>> updateWithImage(ResourceModel post, File image);
//   Future<Resource<bool>> like(String idPost, String idUser);
//   Future<Resource<bool>> deleteLike(String idPost, String idUser);
//   Stream<Resource<List<ResourceModel>>> getPosts();
//   Stream<Resource<List<ResourceModel>>> getPostsById(String id);

// }