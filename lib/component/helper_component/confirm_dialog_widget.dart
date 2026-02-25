import 'package:flutter/material.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/component/logo_component/company_logo.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

void showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required VoidCallback onConfirm,
  String cancelText = 'Cancel',
  String confirmText = 'Confirm',
  IconData icon = Icons.payment_rounded,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    builder: (_) => _ConfirmDialog(
      title: title,
      message: message,
      onConfirm: onConfirm,
      cancelText: cancelText,
      confirmText: confirmText,
      icon: icon,
    ),
  );
}

class _ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final String cancelText;
  final String confirmText;
  final IconData icon;

  const _ConfirmDialog({
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.cancelText,
    required this.confirmText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(child: CompanyLogo()),
            const SizedBox(height: 16),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            ButtonText(
              text: confirmText,
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
            const SizedBox(height: 10),
            ButtonText(
              text: cancelText,
              isOutline: true,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
