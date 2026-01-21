import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../app/core/drive_helper.dart';

class GlobalAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final double borderWidth;
  final Color? borderColor;

  const GlobalAvatar({
    super.key,
    required this.imageUrl,
    this.size = 40, // Default kecil untuk AppBar/Sidebar
    this.borderWidth = 0,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: DriveHelper.getImageUrl(imageUrl),
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: borderWidth > 0
              ? Border.all(
                  color: borderColor ?? Colors.grey.shade200,
                  width: borderWidth,
                )
              : null,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        width: size,
        height: size,
        child: Center(
          child: SpinKitDualRing(
            color: const Color.fromARGB(255, 2, 176, 235),
            size: size * 0.7, // Skalakan spinner sesuai ukuran avatar
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        child: Center(
          child: Text(
            'AD', // Bisa diganti inisial dinamis jika perlu
            style: TextStyle(
              fontSize: size * 0.4,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
