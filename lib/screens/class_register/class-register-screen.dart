import 'package:dsapp/screens/class_register/components/class-register-card.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';

class ClassRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: appTheme().backgroundColor,
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item",),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item",),
                          value: 2,
                        ),
                        DropdownMenuItem(
                            child: Text("Third Item",),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text("Fourth Item",),
                            value: 4
                        )
                      ],
                      onChanged: (value) {
                        print(value);
                      }),
                ),
                Text("10:00AM : 12:00PM"),
              ],
            ),
            SizedBox(height: 10.0,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index){
                    return ClassRegisterCard();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
