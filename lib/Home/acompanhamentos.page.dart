import 'package:flutter/material.dart';

import '../descricao.page.dart';
import '../modelo/item.model.dart';


class AcompanhamentosPage extends StatefulWidget {
  const AcompanhamentosPage({Key? key}) : super(key: key);
  @override
  State<AcompanhamentosPage> createState() => _AcompanhamentosPageState();
}

class _AcompanhamentosPageState extends State<AcompanhamentosPage> {
  List<Item> burger= [
    Item(nome: "Batata Grande",
        preco: 20,
        urlAvatar: "https://media.istockphoto.com/photos/chips-fries-closeup-fast-food-top-view-picture-id1225659636?k=20&m=1225659636&s=612x612&w=0&h=-PdENRkRjWWgtSt6SmzQFNAOByhAIYSOBNV65zw0wwk=",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Batata com molho de queijo e bacon",
        preco: 25,
        urlAvatar: "https://media.istockphoto.com/photos/chips-fries-closeup-fast-food-top-view-picture-id1225659636?k=20&m=1225659636&s=612x612&w=0&h=-PdENRkRjWWgtSt6SmzQFNAOByhAIYSOBNV65zw0wwk=",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Batata pequena",
      preco: 9,
      urlAvatar: "https://media.istockphoto.com/photos/chips-fries-closeup-fast-food-top-view-picture-id1225659636?k=20&m=1225659636&s=612x612&w=0&h=-PdENRkRjWWgtSt6SmzQFNAOByhAIYSOBNV65zw0wwk=",
      descricao: "",
      quantidade : 1,
    ),
    Item(nome: "Batata crocante",
      preco: 7,
      urlAvatar: "https://media.istockphoto.com/photos/chips-fries-closeup-fast-food-top-view-picture-id1225659636?k=20&m=1225659636&s=612x612&w=0&h=-PdENRkRjWWgtSt6SmzQFNAOByhAIYSOBNV65zw0wwk=",
      descricao: "",
      quantidade : 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Acompanhamentos"
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
            title: Text(burger[index].nome),
            subtitle: Text("R\$ "+burger[index].preco!.toStringAsFixed(2),),
            trailing: const Icon(Icons.arrow_forward),

            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DescricaoPage(burger: burger[index])
              ));
            },
          ),
        ),

      ),
    );
  }
}
