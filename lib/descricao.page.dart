import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:testefirebase/repository/carrinho.repository.dart';

import '../../dataBases/db.firestore.dart';
import 'carrinho.page.dart';
import 'modelo/item.model.dart';

class DescricaoPage extends StatefulWidget {
  final Item? burger;
  const DescricaoPage({
    Key? key, this.burger,

  }) : super(key: key);

  @override
  State<DescricaoPage> createState() => _DescricaoPageState();
}

class _DescricaoPageState extends State<DescricaoPage> {

  late CarrinhoRepository itens;

  @override
  Widget build(BuildContext context) {
    itens = Provider.of<CarrinhoRepository>(context);

    return Scaffold(
      appBar: AppBar(

        title: Text(
            "Descrição"
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
        child: Column(
          children: [
            //imagem hamburger
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.burger!.urlAvatar),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36)
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.burger!.nome,
              style: TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "R\$"+widget.burger!.preco!.toStringAsFixed(2),
              style: TextStyle(
                fontSize:30,
                fontWeight: FontWeight.normal,
                color: Colors.deepPurpleAccent
              ),
            ),
            Expanded(child: Container()),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepPurpleAccent,
              child: TextButton(
                child: Text(
                  "Adicionar ao Carrinho",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {

                  createUser();
                  //test();
                 Navigator.of(context).pop();
                  Navigator.of(context).push<int>(MaterialPageRoute(
                    builder: (_) => CarrinhoPage(),

                  ),);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future createUser() async{

   final db = FirebaseFirestore.instance.collection('usuarios/${itens.auth.usuario!.uid}/carrinho').doc(widget.burger!.nome);

    final json = {
      "id": widget.burger!.nome,
      'nome': widget.burger!.nome,
      'preco': widget.burger!.preco,
      'url': widget.burger!.urlAvatar,
      'descricao': widget.burger!.descricao,
      'quatidade': widget.burger!.quantidade,
    };
    await db.set(json);
  }
}
