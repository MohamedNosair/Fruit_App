import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FadeInNetworkImage extends StatefulWidget {
  final String imageUrl;

  const FadeInNetworkImage({super.key, required this.imageUrl});

  @override
  State<FadeInNetworkImage> createState() => _FadeInNetworkImageState();
}

class _FadeInNetworkImageState extends State<FadeInNetworkImage> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 1000),
      child: Image.network(
        widget.imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            // لما الصورة تخلص تحميل تبدأ الأنيميشن
            Future.delayed(const Duration(milliseconds: 1000), () {
              if (mounted) {
                setState(() => _opacity = 1.0);
              }
            });
            return child;
          }
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
             Icon(Icons.broken_image, size: 50.sh, color: Colors.grey),
      ),
    );
  }
}