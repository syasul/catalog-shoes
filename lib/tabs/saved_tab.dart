import 'package:catalog/widgets/custom_action_bar.dart';
import 'package:flutter/material.dart';

class SavedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("SavedTab"),
          ),
          CustomActionBar(
            title: "Saved Tab",
            hasBackArrow: false,
          ),
        ],
      ),
    );
  }
}
