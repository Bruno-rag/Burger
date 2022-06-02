import 'package:flutter/material.dart';

import '../descricao.page.dart';
import '../modelo/item.model.dart';

class SobremesaPage extends StatefulWidget {
  const SobremesaPage({Key? key}) : super(key: key);

  @override
  State<SobremesaPage> createState() => _SobremesaPageState();
}

class _SobremesaPageState extends State<SobremesaPage> {
  List<Item> burger= [
    Item(nome: "Milk shake",
        preco: 16,
        urlAvatar: "https://cdn.pixabay.com/photo/2018/05/01/18/21/eclair-3366430__480.jpg",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Petit Gâteali",
        preco: 16,
        urlAvatar: "https://cdn.pixabay.com/photo/2018/05/01/18/21/eclair-3366430__480.jpg",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Alfajor",
        preco: 7,
        urlAvatar: "https://cdn.pixabay.com/photo/2018/05/01/18/21/eclair-3366430__480.jpg",
        descricao: "",
        quantidade : 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
            "Sobremesa"
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
      body: ListView.builder(
        itemCount: burger.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(burger[index].urlAvatar),
            ),
            title: Text(burger[index].nome,),
            subtitle: Text("R\$ "+burger[index].preco!.toStringAsFixed(2),),
            trailing: const Icon(Icons.arrow_forward),

            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DescricaoPage(burger: burger[index])
              ));
            },
          ),
        ),
        // padding: EdgeInsets.all(30),

      ),
    );
  }
}
