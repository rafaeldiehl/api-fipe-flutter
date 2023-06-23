// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Marca {
  final String codigo;
  final String nome;
  Marca({
    required this.codigo,
    required this.nome,
  });

  Marca copyWith({
    String? codigo,
    String? nome,
  }) {
    return Marca(
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

  factory Marca.fromMap(Map<String, dynamic> map) {
    return Marca(
      codigo: map['codigo'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Marca.fromJson(String source) =>
      Marca.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Marca(codigo: $codigo, nome: $nome)';

  @override
  bool operator ==(covariant Marca other) {
    if (identical(this, other)) return true;

    return other.codigo == codigo && other.nome == nome;
  }

  @override
  int get hashCode => codigo.hashCode ^ nome.hashCode;
}
