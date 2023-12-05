import 'package:flutter/material.dart';
import 'package:learn_linked/src/domain/models/post.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';
import 'package:learn_linked/src/presentation/pages/resource/my_list/posts_mylist_event.dart';
import 'package:learn_linked/src/presentation/pages/resource/my_list/widgets/posts_my_list_item.dart';
import 'package:learn_linked/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostsResourceMyGroupPage extends StatelessWidget {
  const PostsResourceMyGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostsResourceMyListEvent vm = Provider.of<PostsResourceMyListEvent>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: StreamBuilder(
          stream: vm.getPostsById(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                  child: Text(
                'No hay información',
                style: TextStyle(color: Colors.white),
              ));
            }
            final response = snapshot.data;
            if (response is Error) {
              final data = response as Error;
              return Center(
                child: Text('Error: ${data.error}'),
              );
            }
            final postList = response as Success<List<Post>>;
            return ListView.builder(
              itemBuilder: (context, index) =>
                  PostsResourceMyListItem(vm, postList.data[index]),
              itemCount: postList.data.length,
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'group/create');
        },
        backgroundColor: BASE_COLOR,
        child: const Icon(Icons.add),
      ),
    );
  }
}
