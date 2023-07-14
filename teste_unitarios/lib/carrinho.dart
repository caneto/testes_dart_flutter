
import 'item.dart';

class Carrinho {
   List<Item> items;
  Carrinho({
    required this.items,
  });

  double totalCarrinho() {
    var total = 0.0;

    for(var i = 1; i<= items.length; i++) {
      total = items[i].preco;
    }

    return total;
  }  
}
