import 'package:flutter/material.dart';

class FlagImage extends StatelessWidget {
  final String url;
  final double width;

  const FlagImage({super.key, required this.url, this.width = 40});

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return Icon(Icons.flag_outlined, size: width);
    }

    return Image.network(
      url,
      width: width,
      height: width * 0.75,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return SizedBox(
          width: width,
          height: width * 0.75,
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.flag_outlined, size: width);
      },
    );
  }
}
