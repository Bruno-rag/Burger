import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testefirebase/repository/Repository.control.dart';
import 'package:testefirebase/repository/carrinho.repository.dart';
import 'package:testefirebase/services/auth.service.dart';
import 'package:testefirebase/widget/auth.check.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Repository()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => CarrinhoRepository(auth: context.read<AuthService>())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AuthCheck(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: controller,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final nome = controller.text;
          createUser(nome: nome);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  Future createUser({required String nome}) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

    final json = {
      'nome': nome,
      'age': 21,
      'birthday': DateTime(2001, 7, 28),

    };
    await docUser.set(json);
  }
}
