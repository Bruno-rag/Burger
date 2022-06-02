
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testefirebase/pix.page.dart';

import '../services/auth.service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child:
      Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 8, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/photos/thug-life-meme-glasses-pixel-art-modern-iconic-3d-object-picture-id1310981636?b=1&k=20&m=1310981636&s=170667a&w=0&h=GjiqcTE4iPguJP0m8xKdq4Hq2kcstcGJVVk8mRPv4qg="),
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.deepPurpleAccent,
                radius: 120,

              ),
              SizedBox(
                  height: 5),
              Text(
                "NomeUsuario",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
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
