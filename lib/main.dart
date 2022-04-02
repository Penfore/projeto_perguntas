import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

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

    List<String> respostas = temPerguntaSelecionada 
      ? _perguntas[_perguntaSelecionada].cast()["respostas"]
      : []; 

    return MaterialApp
    (
      home: Scaffold
      (
        appBar: AppBar
        (
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada ? Column(
          children: [
            Questao(_perguntas[_perguntaSelecionada]["texto"].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) : Center(
          child: Text(
            "Fim!",
            style: TextStyle(fontSize: 28),
          ),
        ),
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