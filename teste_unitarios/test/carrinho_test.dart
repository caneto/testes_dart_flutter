import 'package:test/test.dart';
import 'package:teste_unitarios/carrinho.dart';
import 'package:teste_unitarios/item.dart';

void main() {
  group('Teste de calculo de valor total do carrinho', () {
    test('Deve calcular o valor total do carrinho ...', () async {
      // preparação
      final items = [
        Item(nome: 'Galaxy A54', preco: 2500),
        Item(nome: 'Galaxy A23', preco: 1300),
        Item(nome: 'Fone de Ouvido', preco: 100),
      ];
      final carrinho = Carrinho(items: items);

      // Ação ou Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinho();

      // Verificação
      assert(valorTotalDoCarrinho == 12200);
    });
  });
}
