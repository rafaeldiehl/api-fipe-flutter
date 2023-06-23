// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ano {
  final String codigo;
  final String nome;
  Ano({
    required this.codigo,
    required this.nome,
  });

  Ano copyWith({
    String? codigo,
    String? nome,
  }) {
    return Ano(
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory Ano.fromMap(Map<String, dynamic> map) {
    return Ano(
      codigo: map['codigo'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ano.fromJson(String source) =>
      Ano.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Ano(codigo: $codigo, nome: $nome)';

  @override
  bool operator ==(covariant Ano other) {
    if (identical(this, other)) return true;

    return other.codigo == codigo && other.nome == nome;
  }

  @override
  int get hashCode => codigo.hashCode ^ nome.hashCode;
}
