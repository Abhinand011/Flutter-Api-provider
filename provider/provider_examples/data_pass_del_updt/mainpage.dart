import 'package:amazon_clone/provider/provider_examples/data_pass_del_updt/taskPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'classpage.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskManage(),
      child:  ToDo(),
    ),
  );
}
class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskPage(),);
  }
}
