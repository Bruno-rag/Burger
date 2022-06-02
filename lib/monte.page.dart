import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../repository/Repository.control.dart';

class MontePage extends StatefulWidget {
  const MontePage({Key? key}) : super(key: key);

  @override
  State<MontePage> createState() => _MontePageState();
}

class _MontePageState extends State<MontePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: Column(
          children: [
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Consumer<Repository>(
                    builder: (context, value, child) {
                      return value.listaBurger.isEmpty ? Text(
                        "Lista vazia",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      )
                      : ListView.builder(
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
                      );
                    }),
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

                 /* Navigator.of(context).push<int>(MaterialPageRoute(
                  builder: (_) => CriaHamburgerPage(),
                  ),);*/
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
