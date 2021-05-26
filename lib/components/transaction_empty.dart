import 'package:flutter/material.dart';

class TransactionEmpty extends StatelessWidget {
  final dynamic constraints;

  const TransactionEmpty({
    Key key,
    @required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
          height: constraints.maxHeight * 0.15,
          child: Text(
            "No registered transactions!",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
          height: constraints.maxHeight * 0.75,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
