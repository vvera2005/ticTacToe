import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/logic/tic_tac_provider.dart';
import 'package:tictactoe/pages/tic_tak_toe_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TicTakProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTakToe(),
    ),
  ));
}
