import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectAllButton extends StatelessWidget {
  const SelectAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Tanlanganlarni o'chirish",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text("Hammasini tanlash",style: TextStyle(
                          color: Colors.black,
                        ),),
                      ),
                      Checkbox(
                        value: true,
                        activeColor: Colors.yellow.shade700,
                        checkColor: Colors.black,
                        focusColor: Colors.yellow,
                        onChanged: (value) {
                          print(value);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10, child: const Divider()),
          ],
        ));
  }
}
