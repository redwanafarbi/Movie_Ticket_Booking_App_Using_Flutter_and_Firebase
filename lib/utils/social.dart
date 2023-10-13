import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  final Function() onGoogleClick;

  const SocialLoginButtons(
      {Key? key, required this.onGoogleClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Material(
            color: Colors.yellow.shade50.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.grey.withOpacity(0.5),width: 0.3)
            ),
            child: InkWell(
              onTap: onGoogleClick,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        "Google",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
