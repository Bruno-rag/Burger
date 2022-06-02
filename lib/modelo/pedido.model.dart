import 'cartao.model.dart';
import 'endereco.model.dart';
import 'item.model.dart';

class Pedido{
  List<Item>? item;
  Endereco? endereco;
  Cartao? cartao;

  Pedido({this.item, this.endereco, this.cartao});

}