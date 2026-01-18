import 'dart:ui';
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

          return Material(
            color: Colors.transparent,
            child: Stack(
              fit: StackFit.expand, // Penuhi seluruh layar
              children: [
                // 1. Background Gradasi Pink-Merah-Biru

                // 2. Efek Blur tipis agar warna menyatu
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(color: Colors.transparent),
                ),

                // 3. Konten Utama
                AbsorbPointer(
                  absorbing: true,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Animasi Besar di Tengah
                        const SpinKitDualRing(
                          color: Color.fromARGB(255, 2, 176, 235),
                          size: 160.0,
                        ),
                        const SizedBox(height: 40),

                        // Tulisan Loading dengan Efek Bayangan
                        const Text(
                          "LOADING",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 176, 235),
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 8,
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
                        Text(
                          "Mohon tunggu sejenak",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
