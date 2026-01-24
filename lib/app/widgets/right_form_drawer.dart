import 'package:flutter/material.dart';
import '../core/responsive_wrapper.dart';

class RightFormDrawer extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onClose;

  const RightFormDrawer({
    super.key,
    required this.title,
    required this.child,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      mobile: (_) => _buildDrawer(context, widthFactor: 0.9),
      tablet: (_) => _buildDrawer(context, widthFactor: 0.9),
      desktop: (_) => _buildDrawer(context, widthFactor: 0.35),
    );
  }

  Widget _buildDrawer(BuildContext context, {required double widthFactor}) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: Colors.white,
      width: screenWidth * widthFactor,
      child: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFF8FAFC), // abu muda (slate-50)
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE5E7EB), // divider halus
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827), // slate-900
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF6B7280), // slate-500
                    ),
                    onPressed: onClose ?? () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // ================= BODY =================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
