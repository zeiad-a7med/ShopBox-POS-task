
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final String message;

  const CustomLoadingWidget({super.key, this.message = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: Color.fromARGB(255, 71, 156, 118),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color.fromARGB(255, 71, 156, 118),
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}