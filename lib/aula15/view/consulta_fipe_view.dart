import 'package:consumo_api/aula15/http/dio_client.dart';
import 'package:consumo_api/aula15/widgets/fipe_dropdown_button.dart';
import 'package:diacritic/diacritic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../classes/marca.dart';
import '../classes/modelo.dart';

class ConsultaFipeView extends StatefulWidget {
  const ConsultaFipeView({super.key});

  @override
  State<ConsultaFipeView> createState() => _ConsultaFipeViewState();
}

class _ConsultaFipeViewState extends State<ConsultaFipeView> {
  late Dio _dio;
  final List<String> _veiculos = ['Carros', 'Motos', 'Caminhões'];
  List<Marca> _marcas = [];
  List<Modelo> _modelos = [];

  String? _veiculo;
  Marca? _marca;
  Modelo? _modelo;

  var _carregandoMarcas = false;
  var _carregandoModelos = false;

  void _serverError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: SizedBox(
          height: 16,
          child: Center(
            child: Text('Erro no servidor. Refaça a operação'),
          ),
        ),
      ),
    );
  }

  Future<void> mudarVeiculo(novo) async {
    var backup = _veiculo;

    setState(() {
      _veiculo = novo;
    });
    try {
      var response = await _dio
          .get('/${removeDiacritics(_veiculo!.toLowerCase())}/marcas');
      _marcas = response.data
          .map<Marca>(
            (marca) => Marca.fromMap(marca),
          )
          .toList();
      _marca = null;
    } on DioException catch (_) {
      _serverError();
      _veiculo = backup;
    }
    setState(() {
      _carregandoMarcas = false;
    });
  }

  Future<void> mudarMarca(nova) async {
    var backup = _marca;

    setState(() {
      _marca = _marcas.singleWhere(
        (marca) => marca.codigo == nova,
      );
      _carregandoModelos = true;
    });

    try {
      var response = await _dio
          .get('/${removeDiacritics(_veiculo!.toLowerCase())}/modelos');
      _modelos = response.data['modelos']
          .map<Modelo>((modelo) => Modelo.fromMap(modelo))
          .toList();
    } on DioException catch (_) {
      _serverError();
      _marca = backup;
    }

    setState(() {
      _carregandoModelos = false;
    });
  }

  @override
  void initState() {
    DioClient.getInstance().then((instance) => _dio = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const Text('Consulta à tabela Fipe'),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text('Veículo'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FipeDropdownButton(
                            // loading: true,
                            hint: 'Selecione um veículo',
                            value: _veiculo,
                            items: _veiculos
                                .map(
                                  (v) => DropdownMenuItem(
                                    value: v,
                                    child: Text(v),
                                  ),
                                )
                                .toList(),
                            onChangeFunc: mudarVeiculo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text('Marca'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FipeDropdownButton(
                            loading: _carregandoMarcas,
                            hint: 'Selecione uma marca',
                            value: _marca?.codigo,
                            items: _marcas
                                .map(
                                  (m) => DropdownMenuItem(
                                    value: m.codigo,
                                    child: Text(m.nome),
                                  ),
                                )
                                .toList(),
                            onChangeFunc: mudarMarca,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text('Modelo'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FipeDropdownButton(
                            loading: _carregandoModelos,
                            hint: 'Selecione um modelo',
                            value: _modelo?.codigo.toString(),
                            items: _modelos
                                .map(
                                  (mo) => DropdownMenuItem(
                                    value: mo.codigo.toString(),
                                    child: Text(mo.nome),
                                  ),
                                )
                                .toList(),
                            onChangeFunc: (modelo) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
