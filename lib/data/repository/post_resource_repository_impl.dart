// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:learn_linked/src/core/constants.dart';
// import 'package:learn_linked/src/domain/models/resource.dart';
// import 'package:learn_linked/src/domain/repository/posts_resources_repository.dart';
// import 'package:learn_linked/src/domain/utils/resource.dart';
// import 'package:injectable/injectable.dart';
// import 'package:path/path.dart';

// @Injectable(as: PostsResourceRepository)
// class PostsResourceRepositoryImpl implements PostsResourceRepository {
//   CollectionReference _postsResourceRef;
//   Reference _postsResourceStorageRef;

//   PostsResourceRepositoryImpl(
//       @Named(RESOURCES) this._postsResourceRef, @Named(RESOURCES) this._postsResourceStorageRef);

//   @override
// Future<Resource<String>> create(ResourceModel post, File file) async {
//   try {
//     String name = basename(file.path);
//     String contentType = getContentType(file);
    
//     TaskSnapshot uploadTask = await _postsResourceStorageRef
//         .child(name)
//         .putFile(file, SettableMetadata(contentType: contentType));

//     String url = await uploadTask.ref.getDownloadURL();
//     post.image = url;

//     final data = await _postsResourceRef.add(post.toJson());

//     return Success('El post se ha creado correctamente');
//   } on FirebaseException catch (e) {
//     return Error(e.message ?? 'Error desconocido');
//   }
// }

// String getContentType(File file) {
//   String extension = file.path.split('.').last.toLowerCase();
  
//   switch (extension) {
//     case 'mp4':
//       return 'video/mp4';
//     case 'png':
//       return 'image/png';
//     case 'mp3':
//       return 'audio/mp3';
//     case 'pdf':
//       return 'application/pdf';
//     default:
//       // Puedes manejar otros tipos de archivos aquí si es necesario
//       return 'application/octet-stream'; // Tipo de contenido por defecto
//   }
// }

//   @override
//   Stream<Resource<List<ResourceModel>>> getPosts() {
//     try {
//       final data = _postsResourceRef.snapshots(includeMetadataChanges: true);
//       final dataMap = data.map((document) => Success(document.docs.map((post) {
//             final id = post.id;
//             final map = {...post.data() as Map<String, dynamic>, 'id': id};
//             return ResourceModel.fromJson(map);
//           }).toList()));
//       return dataMap;
//     } on FirebaseException catch (e) {
//       throw Error(e.message ?? 'Error deconocido');
//     }
//   }

//   @override
//   Stream<Resource<List<ResourceModel>>> getPostsById(String id) {
//     try {
//       final data = _postsResourceRef
//           .where('id_user', isEqualTo: id)
//           .snapshots(includeMetadataChanges: true);
//       final dataMap = data.map((document) => Success(document.docs.map((post) {
//             final id = post.id;
//             final map = {...post.data() as Map<String, dynamic>, 'id': id};
//             return ResourceModel.fromJson(map);
//           }).toList()));
//       return dataMap;
//     } on FirebaseException catch (e) {
//       throw Error(e.message ?? 'Error deconocido');
//     }
//   }

//   @override
//   Future<Resource<String>> delete(String idPost) async {
//     try {
//       await _postsResourceRef.doc(idPost).delete();
//       return Success('El post se ha eliminado correctamente');
//     } on FirebaseException catch (e) {
//       return Error(e.message ?? 'Error deconocido');
//     }
//   }

//   @override
//   Future<Resource<String>> update(ResourceModel post) async {
//     try {
//       Map<String, dynamic> map = {
//         'name': post.name,
//         'description': post.description,
//         'category': post.category
//       };
//       print('id del post sin imagen: ${post.id}');
//       final data = await _postsResourceRef.doc(post.id).update(map);
//       return Success('El posts se ha actualizado correctamente');
//     } on FirebaseException catch (e) {
//       return Error(e.message ?? 'Error desconocido');
//     }
//   }

//   @override
//   Future<Resource<String>> updateWithImage(ResourceModel post, File image) async {
//     try {
//       String name = basename(image.path);
//       TaskSnapshot uploadTask = await _postsResourceStorageRef.child(name).putFile(
//           image,
//           SettableMetadata(
//             contentType: 'image/png',
//           ));
//       String url = await uploadTask.ref.getDownloadURL();
//       if (post.id == null) {
//         return Error('El campo "id" en el objeto Post es nulo');
//       }

//       Map<String, dynamic> map = {
//         'name': post.name,
//         'description': post.description,
//         'category': post.category,
//         'image': url,
//       };
//       print('post.id: ${post.image}');
//       final data = await _postsResourceRef.doc(post.id).update(map);
//       return Success('El posts se ha actualizado correctamente');
//     } on FirebaseException catch (e) {
//       return Error(e.message ?? 'Error desconocido');
//     }
//   }

//   @override
//   Future<Resource<bool>> deleteLike(String idPost, String idUser) async {
//     try {
//       await _postsResourceRef.doc(idPost).update({
//         'likes': FieldValue.arrayRemove([idUser])
//       });
//       return Success(true);
//     } on FirebaseException catch (e) {
//       return Error(e.message ?? 'Error deconocido');
//     }
//   }

//   @override
//   Future<Resource<bool>> like(String idPost, String idUser) async {
//     try {
//       await _postsResourceRef.doc(idPost).update({
//         'likes': FieldValue.arrayUnion([idUser])
//       });
//       return Success(true);
//     } on FirebaseException catch (e) {
//       return Error(e.message ?? 'Error deconocido');
//     }
//   }
// }
