
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testefirebase/pix.page.dart';
import 'package:testefirebase/repository/carrinho.repository.dart';

import '../services/auth.service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late CarrinhoRepository itens;

  @override
  Widget build(BuildContext context) {
    itens = Provider.of<CarrinhoRepository>(context);
    return Container(
      child:
      Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 8, left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.perm_identity,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "nome",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //Configuraçao de endereço e pagamento
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    //Endereço
                    Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                Icons.add_location,
                                size: 30,
                                color: Colors.black87
                            ),
                            Text(
                              "Endereço",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          /*Navigator.of(context).push<int>(
                            MaterialPageRoute(
                              builder: (_) => EnderecoPage(),
                            ),
                          );*/
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //Forma de pagamento
                    Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                Icons.account_balance_wallet,
                                size: 30,
                                color: Colors.black87
                            ),
                            Text(
                              "Forma de pagamento",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black87
                              ),
                            ),

                          ],
                        ),
                        onPressed: () {
                          /*Navigator.of(context).push<int>(
                            MaterialPageRoute(
                              builder: (_) => PixPage(),
                            ),
                          );*/
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //Hitórico de compra
                    Container(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                Icons.history,
                                size: 30,
                                color: Colors.black87
                            ),
                            Text(
                              "Histórico de pedidos",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          /*Navigator.of(context).push<int>(
                            MaterialPageRoute(
                              builder: (_) => HistoricoPage(),
                            ),
                          );*/
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: OutlinedButton(
                    onPressed: () =>logout(),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Sair do aplicativo",
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        )
                      ],
                     ),
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }

  logout() async {
    try {
      await context.read<AuthService>().logout();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
