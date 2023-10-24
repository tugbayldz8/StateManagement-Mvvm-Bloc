import 'package:flutter/material.dart';
import 'package:flutter_learn_full/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..body = 'hhf';
    //user1.body = 'Hello';  *böyle de kullanılabilir
  }

  final user2 = PostModel2(1, 2, 'b', 'a');
  final user3 = PostModel3(2, 2, 'title', 'body');
  final user4 = PostModel4(userId: 1, id: 2, title: 'rf', body: 'body');
  final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
  final user6 = PostModel6(userId: 1, id: 2, title: 'title', body: 'body');
  final user7 = PostModel7();
  var user8 = PostModel8(body: 'aaaa');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user8 = user8.copyWith(title: 'vb');
          user8.updateBody(null);
        });
      }),
      appBar: AppBar(
        title: Text(user8.body ?? 'Not has any data'),
      ),
    );
  }
}
