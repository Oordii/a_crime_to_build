import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String? error;
  final String? text;
  final double height;
  final double width;
  const SubmitButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    this.error,
    this.text,
    this.height = 48,
    this.width = 144,
  });

  @override
  Widget build(BuildContext context) {
    bool isError = error != null;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadiusDirectional.circular(16),
              child: InkWell(
                onTap: isLoading ? null : onTap,
                borderRadius: BorderRadius.circular(16),
                child: Ink(
                  height: height,
                  width: width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isLoading
                        ? Theme.of(context).unselectedWidgetColor
                        : Theme.of(context).highlightColor,
                  ),
                  child: isLoading
                      ? Center(
                          child: const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(text ?? 'Submit')],
                        ),
                ),
              ),
            ),
          ],
        ),
        if (isError)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(error!, style: context.textTheme.labelSmall),
          )
        else
          const SizedBox(height: 20),
      ],
    );
  }
}
