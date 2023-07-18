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
      //
      expect(valorTotalDoCarrinho, 3900);
      //assert(valorTotalDoCarrinho == 3900);
    });
  });

  group('Teste de calculo de valor total do carrinho com imposto', () {
    test('Deve calcular o valor total do carrinho com imposto de 10%',
        () async {
      // preparação
      final items = [
        Item(nome: 'Galaxy A54', preco: 2000),
        Item(nome: 'Galaxy A23', preco: 2000),
        Item(nome: 'Fone de Ouvido', preco: 1000),
      ];
      final carrinho = Carrinho(items: items);

      // Ação ou Execução
      var valorTotal = carrinho.totalCarrinhoImposto();

      // Verificação
      //
      expect(valorTotal, 5500);
    });

    //Se o valor não for menor que 5 mil não cobra imposto,
    //Se o valor não for maior que 20 mil então cobra imposto de 20%.

    test('Deve retornar o valor sem imposto caso seja menor que 5000',
        () async {
      // preparação
      final items = [
        Item(nome: 'Galaxy A54', preco: 2000),
        Item(nome: 'Fone de Ouvido', preco: 1000),
      ];
      final carrinho = Carrinho(items: items);

      // Ação ou Execução
      var valorTotal = carrinho.totalCarrinhoImposto();

      // Verificação
      //
      expect(valorTotal, 3000);
    });

    test('Deve retornar o valor com imposto caso seja igual a 5000', () async {
      // preparação
      final items = [
        Item(nome: 'Galaxy A54', preco: 2500),
        Item(nome: 'Galaxy A23', preco: 1500),
        Item(nome: 'Fone de Ouvido', preco: 1000),
      ];
      final carrinho = Carrinho(items: items);

      // Ação ou Execução
      var valorTotal = carrinho.totalCarrinhoImposto();

      // Verificação
      //
      expect(valorTotal, 5500);
    });

    test('Deve retornar o valor com imposto caso seja superior a 20000 com 20%',
        () async {
      // preparação
      final items = [
        Item(nome: 'Galaxy A54', preco: 2500),
        Item(nome: 'Galaxy A23', preco: 1500),
        Item(nome: 'IPhone', preco: 20000),
      ];

      final carrinho = Carrinho(items: items);

      // Ação ou Execução
      var valorTotal = carrinho.totalCarrinhoImposto();

      // Verificação
      //
      expect(valorTotal, 28800);
    });

  });
  
}
