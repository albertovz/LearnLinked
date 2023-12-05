// import 'package:flutter/material.dart';
// import 'package:learn_linked/src/domain/utils/resource.dart';
// import 'package:learn_linked/src/presentation/pages/resource/create/post_create_event.dart';
// import 'package:learn_linked/src/presentation/utils/show_dialog.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class PostsResourceCreateResponse {
//   BuildContext context;
//   PostsResourceCreateEvent vm;

//   PostsResourceCreateResponse(this.context, this.vm) {
//     if (vm.response is Loading) {
//       buildShowDialog(context);
//     } else if (vm.response is Error) {
//       final data = vm.response as Error;
//       Navigator.pop(context);
//       Fluttertoast.showToast(msg: data.error, toastLength: Toast.LENGTH_LONG);
//       vm.resetResponse();
//     } else if (vm.response is Success) {
//       final success = vm.response as Success<dynamic>;
//       Navigator.pop(context);
//       Fluttertoast.showToast(msg: success.data, toastLength: Toast.LENGTH_LONG);
//       vm.resetResponse();
//       vm.resetState();
//     }
//   }
// }
