import 'package:flutter/material.dart';

import '../descricao.page.dart';
import '../modelo/item.model.dart';


class BebidasPage extends StatefulWidget {
  const BebidasPage({Key? key}) : super(key: key);

  @override
  State<BebidasPage> createState() => _BebidasPageState();
}

class _BebidasPageState extends State<BebidasPage> {
  List<Item> burger= [
    Item(nome: "Cerveja Artesanal",
        preco: 20,
        urlAvatar: "https://media.istockphoto.com/photos/alcoholic-drinks-picture-id816174634?k=20&m=816174634&s=612x612&w=0&h=KTanppG1bSlOoNe6U8ffi4xhekJebe02kiBKK_FzXQ4=",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Cerveja",
        preco: 10,
        urlAvatar: "https://media.istockphoto.com/photos/alcoholic-drinks-picture-id816174634?k=20&m=816174634&s=612x612&w=0&h=KTanppG1bSlOoNe6U8ffi4xhekJebe02kiBKK_FzXQ4=",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Água com gás e sem gás",
        preco: 4,
        urlAvatar: "https://media.istockphoto.com/photos/alcoholic-drinks-picture-id816174634?k=20&m=816174634&s=612x612&w=0&h=KTanppG1bSlOoNe6U8ffi4xhekJebe02kiBKK_FzXQ4=",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Refigerante",
        preco: 6,
        urlAvatar: "https://media.istockphoto.com/photos/alcoholic-drinks-picture-id816174634?k=20&m=816174634&s=612x612&w=0&h=KTanppG1bSlOoNe6U8ffi4xhekJebe02kiBKK_FzXQ4=",
        descricao: "",
        quantidade : 1,
    ),
    Item(nome: "Sucos",
      preco: 6,
      urlAvatar: "https://media.istockphoto.com/photos/alcoholic-drinks-picture-id816174634?k=20&m=816174634&s=612x612&w=0&h=KTanppG1bSlOoNe6U8ffi4xhekJebe02kiBKK_FzXQ4=",
      descricao: "",
      quantidade : 1,
    ),
    Item(nome: "Drinks",
      preco: 18,
      urlAvatar: "https://media.istockphoto.com/photos/alcoholic-drinks-picture-id816174634?k=20&m=816174634&s=612x612&w=0&h=KTanppG1bSlOoNe6U8ffi4xhekJebe02kiBKK_FzXQ4=",
      descricao: "",
      quantidade : 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
            "Bebidas"
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
        // padding: EdgeInsets.all(30),

        //Item
        /*Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0,0.75)

                )
              ],
              gradient: LinearGradient(
                colors: [Colors.indigoAccent, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //image do humgurger
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),

                    image:  DecorationImage(
                        image: NetworkImage("https://c.pxhere.com/photos/13/fa/beef_bread_bun_burger_cheese_cheeseburger_close_up_delicious-1556149.jpg!d"),
                        fit: BoxFit.cover,

                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "Nome Do Hamburger",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Descrição do item",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "R\$ 99,99",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),*/


      ),
    );
  }
}
