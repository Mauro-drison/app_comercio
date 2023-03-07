import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      width: 110.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: const [
            Text('Follow'),
            SizedBox(
              height: 5.0,
            ),
            Icon(Icons.favorite_border)
          ],
        ),
      ),
    );
  }
}
