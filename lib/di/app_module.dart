import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_linked/src/core/constants.dart';
import 'package:learn_linked/src/data/repository/auth_repository_impl.dart';
import 'package:learn_linked/src/data/repository/posts_repository_impl.dart';
import 'package:learn_linked/src/data/repository/users_repository_impl.dart';
import 'package:learn_linked/src/di/firesebase_service.dart';
import 'package:learn_linked/src/domain/repository/auth_repository.dart';
import 'package:learn_linked/src/domain/repository/posts_repository.dart';
import 'package:learn_linked/src/domain/repository/users_repository.dart';
import 'package:learn_linked/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:learn_linked/src/domain/use_cases/auth/login_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/auth/logout_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/auth/register_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/auth/user_session_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/delete_like_post_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/delete_post_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/get_posts_by_id_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/get_posts_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/like_post_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/update_post_image_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/update_post_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/users/getUserById_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/users/getuserbyidonce_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/users/update_image_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/users/update_user_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/create_post_usecase.dart';
import 'package:learn_linked/src/domain/use_cases/posts/posts_usecases.dart';
import 'package:learn_linked/src/domain/use_cases/users/users_usecases.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_storage/firebase_storage.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get fireebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @injectable
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @Named(USERS)
  @injectable
  CollectionReference get usersRef => firebaseFirestore.collection(USERS);

  @Named(USERS)
  @injectable
  Reference get usersStorageRef => firebaseStorage.ref().child(USERS);

  @Named(POSTS)
  @injectable
  CollectionReference get postsRef => firebaseFirestore.collection(POSTS);

  @Named(POSTS)
  @injectable
  Reference get postsStorageRef => firebaseStorage.ref().child(POSTS);

  @Named(INSTITUTIONS)
  @injectable
  CollectionReference get institutionsRef => firebaseFirestore.collection(INSTITUTIONS);

  @Named(INSTITUTIONS)
  @injectable
  Reference get institutionsStorageRef => firebaseStorage.ref().child(INSTITUTIONS);

  // @Named(RESOURCES)
  // @injectable
  // CollectionReference get resourcesRef => firebaseFirestore.collection(RESOURCES);

  // @Named(RESOURCES)
  // @injectable
  // Reference get resourcesStorageRef => firebaseStorage.ref().child(RESOURCES);

  // @Environment(REPOSITORIES)
  // @injectable
  // AuthRepository get authRepository =>
  //     AuthRepositoryImpl(firebaseAuth, usersRef);

  // @Environment(REPOSITORIES)
  // @injectable
  // UsersRepository get usersRepository =>
  //     UsersRepositoryImpl(usersRef, usersStorageRef);

  // @Environment(REPOSITORIES)
  // @injectable
  // PostsRepository get postsRepository =>
  //     PostsRepositoryImpl(postsRef, postsStorageRef);

  // @Environment(USE_CASES)
  // @injectable
  // AuthUseCases get authUseCases => AuthUseCases(
  //     login: LoginUseCase(authRepository),
  //     register: RegisterUseCase(authRepository),
  //     getUser: UserSessionUseCase(authRepository),
  //     logout: LogoutUseCase(authRepository));

  // @Environment(USE_CASES)
  // @injectable
  // UsersUseCase get usersUseCase => UsersUseCase(
  //     getById: GetUserById(usersRepository),
  //     getUserByIdOnce: GetUserByIdOnce(usersRepository),
  //     updateWithoutImage: UpdateUserUseCase(usersRepository),
  //     updateWithImage: UpdateWithImageUseCase(usersRepository));

  // @Environment(USE_CASES)
  // @injectable
  // PostsUseCases get postsUseCases => PostsUseCases(
  //     create: CreatePostUSeCase(postsRepository),
  //     getPosts: GetPostsUseCase(postsRepository),
  //     getPostsById: GetPostsByIdUseCase(postsRepository),
  //     delete: DeletePostUseCase(postsRepository),
  //     update: UpdatePostUseCase(postRepository),
  //     updateWithImage: UpdatePostImageUseCase(postRepository),
  //     like: LikePostUseCase(postRepository),
  //     deleteLike: DeleteLikePostUseCase(postRepository));
}
