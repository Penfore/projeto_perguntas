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
  int _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const  
    [
      {
        "texto": "Qual a sua cor favorita?",
        "respostas": 
        [
          {'texto': "Preto", 'pontuacao': 10}, 
          {'texto': "Vermelho", 'pontuacao': 5}, 
          {'texto': "Verde", 'pontuacao': 3}, 
          {'texto': "Branco", 'pontuacao': 1}
        ],
      },
      {
        "texto": "Qual o seu animal favorito?",
        "respostas": 
        [
          { 'texto': "Coelho", 'pontuacao': 10}, 
          { 'texto': "Cobra", 'pontuacao': 5}, 
          { 'texto': "Elefante", 'pontuacao': 3},
          { 'texto': "Leão", 'pontuacao': 1}
        ],
      },
      {
        "texto": "Qual o seu instrutor favorito?",
        "respostas": 
        [
          {'texto': "Maria", 'pontuacao': 10}, 
          {'texto': "João", 'pontuacao': 5},
          {'texto': "Léo", 'pontuacao': 3},
          {'texto': "Pedro", 'pontuacao': 1}
        ], 
      }
    ];

  void _responder(int pontuacao)
  {

    if(temPerguntaSelecionada)
    {
      setState(() { 
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario()
  {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
        : Resultado(_pontuacaoTotal, _reiniciarQuestionario)
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