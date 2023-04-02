import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testefirebase/Home/criaHamburger.page.dart';
import 'package:testefirebase/repository/carrinho.repository.dart';

import '../../repository/Repository.control.dart';
import 'modelo/item.model.dart';


class MontePage extends StatefulWidget {
  const MontePage({Key? key}) : super(key: key);

  @override
  State<MontePage> createState() => _MontePageState();
}

class _MontePageState extends State<MontePage> {
  late CarrinhoRepository itens;
  @override
  Widget build(BuildContext context) {
    itens = Provider.of<CarrinhoRepository>(context);
    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: Column(
          children: [
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Expanded(
                        child: StreamBuilder<List<Item>>(
                          stream: readUsers(),
                          builder: (context, snapshot){
                            if(snapshot.hasError){
                              return Text("Error: ${snapshot.error}");
                            } else if(snapshot.hasData){
                              final users = snapshot.data!;
                              return ListView(
                                children: users.map(buildUser).toList(),
                              );
                            }else{
                              return Center(child: CircularProgressIndicator(),);
                            }
                        },
                      )),
                      /*ListView.builder(
                          itemCount: value.listaBurger.length,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(value.listaBurger[index].urlAvatar),
                              ),
                              title: Text(value.listaBurger[index].nome),
                              subtitle: Text("R\$ "+value.listaBurger[index].preco!.toStringAsFixed(2)),
                              trailing:  IconButton(onPressed: () {
                                value.removeBurger(index);
                              },
                                  icon: Icon(Icons.delete)
                              ),
                              onTap: (){
                              },
                            ),
                          )
                      );*/

              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Botão adiciona novo endereço
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepPurpleAccent,
              child: TextButton(
                child: Text(
                "Criar novo hamburger",
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                ),
                ),
                onPressed: () {

                  Navigator.of(context).push<int>(MaterialPageRoute(
                  builder: (_) => CriaHamburgerPage(),
                  ),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUser(Item item) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.urlAvatar),
        ),
        title: Text(
          item.nome,
          style: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
        subtitle: Text(
          "R\$ " + item.preco!.toStringAsFixed(2),
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,

          ),
        ),
        trailing:  IconButton(
            onPressed: () {
              removeItem(item);
            },
            icon: Icon(Icons.delete)
        ),
      ),
    );}


  Stream<List<Item>> readUsers() => FirebaseFirestore.instance
      .collection('usuarios/${itens.auth.usuario!.uid}/ListaBurger')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Item.fromJson(doc.data())).toList());

  Future removeItem(Item item)async{
    final db = FirebaseFirestore.instance.collection('usuarios/${itens.auth.usuario!.uid}/ListaBurger');
    await db.doc(item.nome).delete();
  }
}
