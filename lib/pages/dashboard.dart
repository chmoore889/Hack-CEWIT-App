import 'package:flutter/material.dart';

import 'dog.dart';
import 'store_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: !Store.doesHaveHat()?((Store.getCount()==0)?DogAnimation1():(Store.getCount()==1)? DogAnimation2():(Store.getCount()==2)? DogAnimation3():DogAnimation4()):Hat(),
    );
  }
}