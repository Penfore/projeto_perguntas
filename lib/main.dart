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

  void _responder()
  {
    setState(() { 
    _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    final List<Map<String, Object>> perguntas = 
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

    List<String> respostas = perguntas[_perguntaSelecionada].cast()["respostas"]; 

    return MaterialApp
    (
      home: Scaffold
      (
        appBar: AppBar
        (
          title: Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]["texto"].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        )
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