import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> downloadPDF(BuildContext context) async {
  const String url =
      'https://drive.google.com/file/d/1m7p8U-ou2VLWS4hIuq1NHKV1b4WbH5wD/view?usp=sharing';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Uint8List bytes = response.bodyBytes;

    final appDir = await getExternalStorageDirectory();
    final pdfPath = "${appDir!.path}/downloaded_file.pdf";

    final File pdfFile = File(pdfPath);
    await pdfFile.writeAsBytes(bytes, flush: true);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF descargado correctamente en $pdfPath'),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al descargar el PDF'),
      ),
    );
  }
}
