import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testefirebase/monte.page.dart';
import 'package:testefirebase/perfil.page.dart';
import 'package:testefirebase/Home/home.page.dart';
import 'package:testefirebase/repository/carrinho.repository.dart';
import '../services/auth.service.dart';
import 'carrinho.page.dart';



class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}
class _AppBarPageState extends State<AppBarPage> {
  late CarrinhoRepository itens;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    itens = Provider.of<CarrinhoRepository>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hamburgueria'),
          actions: [
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              iconSize: 25,
              onPressed: () {
                createUser();
                Navigator.of(context).push<int>(MaterialPageRoute(
                  builder: (_) => CarrinhoPage(),
                ),);
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigoAccent, Colors.deepPurpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          bottom: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Criar'),
              Tab(icon: Icon(Icons.face), text: 'Perfil'),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            MontePage(),
            PerfilPage(),
          ],
        ),
      ),
    );

    Widget buildPage(String text, {body, child}) =>
        Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 28),
          ),
        );
  }
  Future createUser() async{

    final db = FirebaseFirestore.instance.collection('usuarios/${itens.auth.usuario!.uid}/info').doc('Info');

    final json = {
      'nome': 'itens.user!.nome2',
      'url': 'itens.user!.sobrenome2',
    };
    await db.set(json);
  }
}