// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import 'utils.dart';
import 'ip.dart';

class SignaturePreviewPage extends StatelessWidget {
  final Uint8List signature;

  const SignaturePreviewPage({
    Key? key,
    required this.signature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: CloseButton(),
          title: Text('Store Signature'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () => storeSignature(context),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Center(
          child: Image.memory(signature, width: double.infinity),
        ),
      );

  Future storeSignature(BuildContext context) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    //Salvando na galeria a imagem e tentando enviar para o server
    final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'signature_$time.png';

    final result = await ImageGallerySaver.saveImage(signature, name: name);
    final isSuccess = result['isSuccess'];

    print(signature);

    var request = http.MultipartRequest("POST", urlAssinaturas);
    request.fields['titulo'] = "Assinatura";
    request.files.add(http.MultipartFile.fromBytes("signature", signature));
    var response = await request.send();
    print(response.statusCode);

    if (isSuccess) {
      Navigator.pop(context);

      Utils.showSnackBar(
        context,
        text: 'Assinatura salva ',
        color: Colors.green,
      );
    } else {
      Utils.showSnackBar(
        context,
        text: 'N??o foi poss??vel salvar a assinatura',
        color: Colors.red,
      );
    }
  }
}
