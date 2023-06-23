// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DadosTabelaFipe {
  final int tipoVeiculo;
  final String valor;
  final String marca;
  final String modelo;
  final int anoModelo;
  final String combustivel;
  final String codigoFipe;
  final String mesReferencia;
  final String siglaCombutivel;
  DadosTabelaFipe({
    required this.tipoVeiculo,
    required this.valor,
    required this.marca,
    required this.modelo,
    required this.anoModelo,
    required this.combustivel,
    required this.codigoFipe,
    required this.mesReferencia,
    required this.siglaCombutivel,
  });

  DadosTabelaFipe copyWith({
    int? tipoVeiculo,
    String? valor,
    String? marca,
    String? modelo,
    int? anoModelo,
    String? combustivel,
    String? codigoFipe,
    String? mesReferencia,
    String? siglaCombutivel,
  }) {
    return DadosTabelaFipe(
      tipoVeiculo: tipoVeiculo ?? this.tipoVeiculo,
      valor: valor ?? this.valor,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      anoModelo: anoModelo ?? this.anoModelo,
      combustivel: combustivel ?? this.combustivel,
      codigoFipe: codigoFipe ?? this.codigoFipe,
      mesReferencia: mesReferencia ?? this.mesReferencia,
      siglaCombutivel: siglaCombutivel ?? this.siglaCombutivel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipoVeiculo': tipoVeiculo,
      'valor': valor,
      'marca': marca,
      'modelo': modelo,
      'anoModelo': anoModelo,
      'combustivel': combustivel,
      'codigoFipe': codigoFipe,
      'mesReferencia': mesReferencia,
      'siglaCombutivel': siglaCombutivel,
    };
  }

  factory DadosTabelaFipe.fromMap(Map<String, dynamic> map) {
    return DadosTabelaFipe(
      tipoVeiculo: map['TipoVeiculo'] as int,
      valor: map['Valor'] as String,
      marca: map['Marca'] as String,
      modelo: map['Modelo'] as String,
      anoModelo: map['AnoModelo'] as int,
      combustivel: map['Combustivel'] as String,
      codigoFipe: map['CodigoFipe'] as String,
      mesReferencia: map['MesReferencia'] as String,
      siglaCombutivel: map['SiglaCombutivel'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DadosTabelaFipe.fromJson(String source) =>
      DadosTabelaFipe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DadosTabelaFipe(tipoVeiculo: $tipoVeiculo, valor: $valor, marca: $marca, modelo: $modelo, anoModelo: $anoModelo, combustivel: $combustivel, codigoFipe: $codigoFipe, mesReferencia: $mesReferencia, siglaCombutivel: $siglaCombutivel)';
  }

  @override
  bool operator ==(covariant DadosTabelaFipe other) {
    if (identical(this, other)) return true;

    return other.tipoVeiculo == tipoVeiculo &&
        other.valor == valor &&
        other.marca == marca &&
        other.modelo == modelo &&
        other.anoModelo == anoModelo &&
        other.combustivel == combustivel &&
        other.codigoFipe == codigoFipe &&
        other.mesReferencia == mesReferencia &&
        other.siglaCombutivel == siglaCombutivel;
  }

  @override
  int get hashCode {
    return tipoVeiculo.hashCode ^
        valor.hashCode ^
        marca.hashCode ^
        modelo.hashCode ^
        anoModelo.hashCode ^
        combustivel.hashCode ^
        codigoFipe.hashCode ^
        mesReferencia.hashCode ^
        siglaCombutivel.hashCode;
  }
}
