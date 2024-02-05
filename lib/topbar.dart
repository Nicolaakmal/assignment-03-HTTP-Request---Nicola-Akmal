import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: const Alignment(0, 0),
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: const Text(
            "REST API_json_place holder",
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
          ),
        ),
      ],
    );
  }
}
