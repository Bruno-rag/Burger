
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../carrinho.page.dart';
import '../modelo/item.model.dart';
import '../repository/Repository.control.dart';
import '../repository/carrinho.repository.dart';


class CriaHamburgerPage extends StatefulWidget {
  const CriaHamburgerPage({Key? key}) : super(key: key);
  @override
  State<CriaHamburgerPage> createState() => _CriaHamburgerPageState();
}

class _CriaHamburgerPageState extends State<CriaHamburgerPage> {
  String nome = "";
  late CarrinhoRepository itens;

  @override
  Widget build(BuildContext context) {
    itens = Provider.of<CarrinhoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Monte seu hamburger",

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                top:0,
                left: 40,
                right: 40,
              ),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "Nome do hamburger",
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                //  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                onChanged: (texto){
                  nome = texto;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<Repository>(
                builder:(context, valueIngre, child){
                  return ListView.builder(
                    itemCount: valueIngre.listaIngre.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(valueIngre.listaIngre[index].nome!),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    valueIngre.maisIngredinte(index);

                                  },
                                  icon: Icon(Icons.add)
                                ),

                                Text(valueIngre.listaIngre[index].quantidade.toString()),
                                IconButton(
                                  onPressed: () {
                                      valueIngre.menosIngredinte(index);

                                  },
                                  icon: Icon(Icons.remove)
                                ),
                                Text("R\$ "+ valueIngre.valorIngre(index).toStringAsFixed(2)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
              ),
            ),
            Consumer<Repository>(
                builder:(context, valueIngre, child){
                  return Container(
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
                        /*
                        nome
                        valueIngre.criarDescricao();
                        valueIngre.valorTotalIngre();*/
                        /*Item item =  Item(
                            nome: nome,
                            preco: valueIngre.valorTotalIngre(),
                            urlAvatar: "https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d",
                            descricao: valueIngre.criarDescricao(),
                            quantidade: 1,
                        );*/

                        //valueIngre.itemAdd(item);
                        //valueIngre.addBurger(item);

                        createUser(valueIngre.valorTotalIngre());
                        Navigator.of(context).pop();
                        Navigator.of(context).push<int>(MaterialPageRoute(
                          builder: (_) => CarrinhoPage(),
                        ),);
                      },
                    ),
                  );
                }
            )

          ],
        ),
      )
    );

  }

  Future createUser(double preco) async{

    final docCar = FirebaseFirestore.instance.collection('usuarios/${itens.auth.usuario!.uid}/carrinho').doc(nome);
    final doclist = FirebaseFirestore.instance.collection('usuarios/${itens.auth.usuario!.uid}/ListaBurger').doc(nome);

    final json = {
      "id": nome,
      'nome': nome,
      'preco': preco,
      'url': "https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d",
      'descricao': "",
      'quatidade': 1,
    };
    await docCar.set(json);
    await doclist.set(json);
  }

}
