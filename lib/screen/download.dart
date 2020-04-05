//   import 'dart:io';
//   final String downloadFolder = 'psdownload';
// Future<void> downloadFile(String name) async {
//     Directory dir;
//     if (Platform.isIOS) {
//       dir = await getApplicationDocumentsDirectory();
//     } else {
//       dir = await getExternalStorageDirectory();
//     }

//     final String downloadDirectoryPath =
//         '${dir.path}/$downloadFolder';
//     final Directory downloadDirectory =
//         Directory(downloadDirectoryPath);

//     final bool isThere = downloadDirectory.existsSync();
//     if (!isThere) {
//       await downloadDirectory.create();
//     }

//     final Dio dio = Dio();

//     // for android

//     await dio.download(ps_app_image_url + name,
//         '${dir.path}/$downloadFolder/$name', //.jpg
//         onReceiveProgress: (int rec, int total) {
//       print('Rec: $rec , Total: $total');

//       final double progress =
//           double.parse(((rec / total) * 100).toStringAsFixed(0));
//       print('progress : $progress');
//       downloadProgressDialog.update(
//           message: Utils.getString(
//               context, 'product_detail__downloading_file'),
//           progressWidget: Container(
//               padding: const EdgeInsets.all(10.0),
//               child: const CircularProgressIndicator()),
//           progress: progress,
//           maxProgress: 100.0,
//           progressTextStyle: const TextStyle(
//               color: Colors.black,
//               fontSize: 13.0,
//               fontWeight: FontWeight.w400),
//           messageTextStyle: const TextStyle(
//               color: Colors.black,
//               fontSize: 15.0,
//               fontWeight: FontWeight.w600));
//     });

//     downloadProgressDialog.dismiss();

//     showDialog<dynamic>(
//         context: context,
//         builder: (BuildContext context) {
//           return SuccessDialog(
//             message: Utils.getString(
//                     context, 'success_dialog__download_success') +
//                 '${dir.path}/$downloadFolder/$name',
//           );
//         });
//   } Future<bool> requestWritePermission() async {
//     final Map<PermissionGroup, PermissionStatus> permissionss =
//         await PermissionHandler().requestPermissions(
//             <PermissionGroup>[PermissionGroup.storage]);
//     if (permissionss != null &&
//         permissionss.isNotEmpty &&
//         permissionss[PermissionGroup.storage] ==
//             PermissionStatus.granted) {
//       return true;
//     } else {
//       return false;
//     }
//   }