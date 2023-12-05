import 'package:flutter/material.dart';
import 'package:learn_linked/src/domain/models/post.dart';
import 'package:learn_linked/src/presentation/pages/resource/update/post_update_response.dart';
import 'package:learn_linked/src/presentation/pages/resource/update/posts_update_event.dart';
import 'package:learn_linked/src/presentation/pages/resource/update/widgets/posts_update_content.dart';
import 'package:learn_linked/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostsResourceUpdatePage extends StatelessWidget {
  const PostsResourceUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    PostsResourceUpdateEvent vm = Provider.of<PostsResourceUpdateEvent>(context);
    Post postArg = ModalRoute.of(context)?.settings.arguments as Post;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PostResourceUpdateResponse(context, vm);
    });

    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: FutureBuilder(
            future: vm.loadData(postArg),
            builder: (context, _) => PostsResourceUpdateContent(vm, postArg)));
  }
}
