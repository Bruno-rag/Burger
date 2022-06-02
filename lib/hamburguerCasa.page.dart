
import 'package:flutter/material.dart';

import 'descricao.page.dart';
import 'modelo/item.model.dart';


class HamburgerCasa extends StatefulWidget {
  const HamburgerCasa({Key? key}) : super(key: key);

  @override
  State<HamburgerCasa> createState() => _HamburgerCasaState();
}

class _HamburgerCasaState extends State<HamburgerCasa> {
  final urlBurger = "https://media.istockphoto.com/photos/burger-isolated-on-white-picture-id840902892?b=1&k=20&m=840902892&s=170667a&w=0&h=ld3yD9lC4wQnHEpk7SsQlUZp4XkqVUAc5DPJsLRLsi4=";
  List<Item> burger= [
    Item(nome: "Garage Premium",
        preco: 29,
        urlAvatar: "https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Bora",
        preco: 28,
        urlAvatar: "https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "viper",
      preco: 28,
      urlAvatar: "https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d",
      descricao: "",
      quantidade : 1,
    ),
    Item(nome: "Coalho",
      preco: 29,
      urlAvatar: "https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d",
      descricao: "",
      quantidade : 1,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Hamburger da casa"
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
      ),
    );
  }
}
