// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Modelo {
  final int codigo;
  final String nome;
  Modelo({
    required this.codigo,
    required this.nome,
  });

  Modelo copyWith({
    int? codigo,
    String? nome,
  }) {
    return Modelo(
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

  factory Modelo.fromMap(Map<String, dynamic> map) {
    return Modelo(
      codigo: map['codigo'] as int,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Modelo.fromJson(String source) =>
      Modelo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Modelo(codigo: $codigo, nome: $nome)';

  @override
  bool operator ==(covariant Modelo other) {
    if (identical(this, other)) return true;

    return other.codigo == codigo && other.nome == nome;
  }

  @override
  int get hashCode => codigo.hashCode ^ nome.hashCode;
}
