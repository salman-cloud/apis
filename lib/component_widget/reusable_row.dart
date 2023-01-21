import 'package:flutter/cupertino.dart';

class ReUseableRow extends StatelessWidget {

String title,value;
 ReUseableRow({Key? key,
   required this.title,
   required this.value,


 }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
