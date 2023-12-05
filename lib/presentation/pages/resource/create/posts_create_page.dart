// import 'package:flutter/material.dart';
// import 'package:learn_linked/src/presentation/pages/resource/create/post_create_event.dart';
// import 'package:learn_linked/src/presentation/pages/resource/create/posts_create_response.dart';
// import 'package:learn_linked/src/presentation/pages/resource/create/widgets/posts_create_content.dart';
// import 'package:learn_linked/src/presentation/utils/base_color.dart';
// import 'package:provider/provider.dart';

// class PostsResourceCreatePage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     PostsResourceCreateEvent vm = Provider.of<PostsResourceCreateEvent>(context);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       PostsResourceCreateResponse(context, vm);
//     });

//     return Scaffold(
//       backgroundColor: BACKGROUND_COLOR,
//       body: PostsResourceCreateContent(vm),
//     );
//   }
// }