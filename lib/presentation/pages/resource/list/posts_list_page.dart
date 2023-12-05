// import 'package:flutter/material.dart';
// import 'package:learn_linked/src/domain/models/post.dart';
// import 'package:learn_linked/src/domain/models/resource.dart';
// import 'package:learn_linked/src/domain/utils/resource.dart';
// import 'package:learn_linked/src/presentation/pages/resource/list/posts_list_event.dart';
// import 'package:learn_linked/src/presentation/pages/resource/list/widgets/posts_list_item.dart';
// import 'package:learn_linked/src/presentation/utils/base_color.dart';
// import 'package:provider/provider.dart';

// class PostResourceGroupPage extends StatelessWidget {
//   const PostResourceGroupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PostsResourceListEvent vm = Provider.of<PostsResourceListEvent>(context);

//     return Scaffold(
//         backgroundColor: BACKGROUND_COLOR,
//         body: StreamBuilder(
//             stream: vm.getPosts(),
//             builder: ((context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (!snapshot.hasData) {
//                 return const Center(
//                     child: Text(
//                   'No hay información',
//                   style: TextStyle(color: Colors.white),
//                 ));
//               }
//               final response = snapshot.data;
//               if (response is Error) {
//                 final data = response as Error;
//                 return Center(
//                   child: Text('Error: ${data.error}'),
//                 );
//               }
//               final postList = response as Success<List<ResourceModel>>;
//               return ListView.builder(
//                 itemBuilder: (context, index) =>
//                     PostsResourceListItem(vm, postList.data[index]),
//                 itemCount: postList.data.length,
//               );
//             })));
//   }
// }
