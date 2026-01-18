import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:typed_data';
import 'dart:convert';

class AuthNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const AuthNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  Future<Uint8List> _loadImage() async {
    final dio = Dio();
    final username = 'testapp';
    final password = '5S0Q YjyH 4s3G elpe 5F8v u8as';
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await dio.get(
      imageUrl,
      options: Options(
        responseType: ResponseType.bytes,
        headers: {
          'Authorization': basicAuth,
        },
      ),
    );

    return Uint8List.fromList(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _loadImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Icon(Icons.broken_image, color: Colors.red, size: 50);
        } else {
          return Image.memory(
            snapshot.data!,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}
