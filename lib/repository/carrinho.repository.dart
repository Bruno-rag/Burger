
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../dataBases/db.firestore.dart';
import '../modelo/item.model.dart';
import '../services/auth.service.dart';
import 'Repository.control.dart';

class CarrinhoRepository extends ChangeNotifier{
  List<Item> _item = [];
  List<Item> _teste = [
    Item(nome: "Garage Premium",
      preco: 29,
      urlAvatar: "https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d",
      descricao: "",
      quantidade : 1,
    ),
  ];
  late FirebaseFirestore db;
  late AuthService auth;




  CarrinhoRepository({required this.auth}) {
    _startRepository();
  }

  UnmodifiableListView<Item> get listaItem => UnmodifiableListView(_item);

  _startRepository() async {
    await _startFirestore();
   // await _readCarrinho();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readCarrinho() async {
    if (auth.usuario != null && _item.isEmpty) {
      final snapshot =
      await db.collection('usuarios/${auth.usuario!.uid}/carrinho').get();

      snapshot.docs.forEach((doc) {
        Item item = _teste.firstWhere((item) => item.nome == doc.get('nome'));
        _item.add(item);
        notifyListeners();
      });
    }
  }
  saveAll(List<Item> itens) {
    itens.forEach((item) async {
      if (!_item.any((atual) => atual.nome == item.nome)) {
        _item.add(item);
        await db
            .collection('usuarios/${auth.usuario!.uid}/carrinho')
            .doc(item.nome)
            .set({
          'nome': item.nome,
          //'quatidade': item.quantidade,
          //'preco': item.preco,
        });
      }
    });
    notifyListeners();
  }
  save(Item itens) async*{
        _item.add(itens);
        await db
            .collection('usuarios/${auth.usuario!.uid}/carrinho')
            .doc(itens.nome)
            .set({
          'nome': itens.nome,
         // 'quatidade': itens.quantidade,
         // 'preco': itens.preco,
        });
        notifyListeners();
  }

  Stream<Future> test() async*{
    // Create a new user with a first and last name
    final user ={
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };

    await db.collection('users').doc('1454').set(user);

   /* await db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));*/
    notifyListeners();
  }



  remove(Item item) async {
    await db
        .collection('usuarios/${auth.usuario!.uid}/carrinho')
        .doc(item.nome)
        .delete();
    _item.remove(item);
    notifyListeners();
  }

}