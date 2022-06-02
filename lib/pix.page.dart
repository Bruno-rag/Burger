import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class PixPage extends StatefulWidget {
  const PixPage({Key? key}) : super(key: key);

  @override
  State<PixPage> createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {



  @override
  Widget build(BuildContext context) {
   // itens = Provider.of<CarrinhoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pix",
        ),
        //estilo do appbar
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigoAccent, Colors.deepPurpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        child: TextButton(

          onPressed: (){
            //itens.test();
            createUser();
          },
          child: Text("teste"),
        ),
      ),
    );
  }

  Future createUser() async{
    final docUser = FirebaseFirestore.instance.collection('users').doc('4566');

    final json = {
      'nome': 'teste55',
      'age': 21,
      'birthday': DateTime(2001, 7, 28),
    };
    await docUser.set(json);
  }

}
