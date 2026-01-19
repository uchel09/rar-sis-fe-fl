import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../controllers/global_loading_controller.dart';

class GlobalLoadingWidget extends StatelessWidget {
  final Widget child;

  const GlobalLoadingWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Obx(() {
          final isVisible = Get.find<GlobalLoadingController>().isLoading.value;
          if (!isVisible) return const SizedBox.shrink();

          // 1. Positioned ditaruh di sini agar jadi anak langsung dari Stack (lewat Obx)
          return Positioned.fill(
            child: Material(
              // 2. Material di bawah Positioned
              color: Colors.black.withOpacity(
                0.05,
              ), // Opacity ditaruh di Material atau Container
              child: AbsorbPointer(
                absorbing: true,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SpinKitDualRing(
                        color: Color.fromARGB(255, 2, 176, 235),
                        size: 160.0,
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "LOADING",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 176, 235),
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 8,
                          decoration: TextDecoration.none,
                          shadows: [
                            Shadow(
                              blurRadius: 20.0,
                              color: Color.fromARGB(115, 3, 9, 193),
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Mohon tunggu sejenak",
                        style: TextStyle(
                          color: Color.fromARGB(255, 15, 231, 255),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
