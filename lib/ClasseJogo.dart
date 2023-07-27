import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}
class _JogoState extends State<Jogo> {

  var _imagemCPU = AssetImage("images/padrao.png");
  var _avisoResultado = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoesJogo = ["pedra", "papel", "tesoura"];
    var numAle = Random().nextInt(opcoesJogo.length);
    var opcaoCPU = opcoesJogo[numAle];

    switch(opcaoCPU){
      case "pedra":
        if(escolhaUsuario == "papel"){
          this._avisoResultado = "Você ganhou!";
        } else if(escolhaUsuario == "pedra"){
          this._avisoResultado = "Empatamos!";
        } else {
          this._avisoResultado = "Você perdeu!";
        }
        setState(() {
          this._imagemCPU = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        if(escolhaUsuario == "tesoura"){
          this._avisoResultado = "Você ganhou!";
        } else if(escolhaUsuario == "papel"){
          this._avisoResultado = "Empatamos!";
        } else {
          this._avisoResultado = "Você perdeu!";
        }
        setState(() {
          this._imagemCPU = AssetImage("images/papel.png");
        });
        break;

      case "tesoura":
        if(escolhaUsuario == "pedra"){
          this._avisoResultado = "Você ganhou!";
        } else if(escolhaUsuario == "tesoura"){
          this._avisoResultado = "Empatamos!";
        } else {
          this._avisoResultado = "Você perdeu!";
        }
        setState(() {
          this._imagemCPU = AssetImage("images/tesoura.png");
        });
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          Image(image: this._imagemCPU,),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              _avisoResultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 90),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 90),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 90),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
