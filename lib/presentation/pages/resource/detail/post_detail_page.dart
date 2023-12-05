// import 'package:flutter/material.dart';
// import 'package:learn_linked/src/domain/models/post.dart';
// import 'package:learn_linked/src/presentation/pages/resource/detail/posts_detail_event.dart';
// import 'package:learn_linked/src/presentation/pages/resource/detail/widgets/posts_detail_content.dart';
// import 'package:learn_linked/src/presentation/utils/base_color.dart';
// import 'package:provider/provider.dart';

// class PostsResourceDetailPage extends StatelessWidget {
//   PostsResourceDetailPage();

//   @override
//   Widget build(BuildContext context) {
//     PostsResourceDetailEvent vm = Provider.of<PostsResourceDetailEvent>(context);
//     Post postArg = ModalRoute.of(context)?.settings.arguments as Post;
//     return Scaffold(
//       backgroundColor: BACKGROUND_COLOR,
//       body: PostsResourceDetailContent(vm, postArg));
//   }
// }
