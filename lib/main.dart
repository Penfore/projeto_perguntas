import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main()
{
  runApp(PerguntasApp());
}

class _PerguntasAppState extends State<PerguntasApp>
{

  int _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const  
    [
      {
        "texto": "Qual a sua cor favorita?",
        "respostas": ["Preto", "Vermelho", "Verde", "Branco"]
      },
      {
        "texto": "Qual o seu animal favorito?",
        "respostas": ["Coelho", "Cobra", "Elefante", "Leão"]
      },
      {
        "texto": "Qual o seu instrutor favorito?",
        "respostas": ["Maria", "João", "Léo", "Pedro"] 
      }
    ];

  void _responder()
  {

    if(temPerguntaSelecionada)
    {
      setState(() { 
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada
  {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context)
  {

    return MaterialApp
    (
      home: Scaffold
      (
        appBar: AppBar
        (
          title: const Text("Perguntas"),
        ),
        
        body: temPerguntaSelecionada 
        ? Questionario(
          perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada,
          quandoResponder: _responder,
        ) 
        : Resultado()
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget
{
  _PerguntasAppState createState()
  {
    return _PerguntasAppState();
  }
}