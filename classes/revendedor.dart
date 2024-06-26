import 'pessoa.dart';
import 'produto.dart';
import 'enums.dart';

class Revendedor extends Pessoa {
  final String matricula;
  List<Produto> produtosVendidos = [];
  double porcentagemLucro = 0.3;

  Revendedor(
      {required this.matricula,
      required String nome,
      required String cpf,
      required DateTime dataDeNascimento,
      required Genero genero})
      : super(
            nome: nome,
            cpf: cpf,
            dataDeNascimento: dataDeNascimento,
            genero: genero);

  void falar(String falar) {
    switch (genero) {
      case Genero.Masculino:
        print('Revendedor $nome diz: $falar');
        break;
      case Genero.Feminino:
        print('Revendedora $nome diz: $falar');
        break;
      case Genero.Outro:
        print('Pessoa revendedora $nome diz: $falar');
        break;
    }
  }

  void venderProduto(Produto produto) {
    try {
      produto.realizarVenda();
      this.produtosVendidos.add(produto);
    } catch (excecao) {
      throw excecao;
    }
  }

  double calcularTotalVendido() {
    double total = 0.0;

    produtosVendidos.forEach((produto) => total += produto.valor);

    return total;
  }

  double calcularMediaProdutosVendidos() {
    double total = 0.0;
    if (produtosVendidos.isEmpty) {
      return 0;
    }

    produtosVendidos.forEach((produto) => total += produto.valor);

    return total / produtosVendidos.length;
  }

  double calcularLucro() {
    double totalVendido = calcularTotalVendido();
    return totalVendido * porcentagemLucro;
  }

  void verResumo() {
    double totalVendido = calcularTotalVendido();
    double media = calcularMediaProdutosVendidos();
    double lucro = calcularLucro();

    print(
        "O total vendido por $nome foi ${totalVendido.toStringAsFixed(2)} reais e a média aritmética de valor dos produtos vendidos é ${media.toStringAsFixed(2)} reais.");
    print("O lucro recebido foi de ${lucro.toStringAsFixed(2)} reais.");
  }
}
