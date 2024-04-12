import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/logic/tic_tac_provider.dart';

class TicTakToe extends StatelessWidget {
  const TicTakToe({super.key});
  @override
  Widget build(BuildContext context) {
    Map<int, FilledWith> elementMap = context.watch<TicTakProvider>().elements;
    return context.read<TicTakProvider>().winner != FilledWith.none
        ? GestureDetector(
            onTap: () => context.read<TicTakProvider>().newGame(),
            child: Scaffold(
                backgroundColor: const Color(0xff0C1017),
                body: Center(
                  child: Text(
                    context.read<TicTakProvider>().winner == FilledWith.x
                        ? "X won"
                        : " O  won",
                    style: const TextStyle(fontSize: 100, color: Colors.blue),
                  ),
                )),
          )
        : Scaffold(
            backgroundColor: const Color(0xff0C1017),
            body: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 177),
                  Text(
                    context.watch<TicTakProvider>().winner == FilledWith.none
                        ? context.watch<TicTakProvider>().stage ==
                                FilledWith.none
                            ? "Loading"
                            : context.watch<TicTakProvider>().stage ==
                                    FilledWith.x
                                ? "X TURN "
                                : "O TURN"
                        : context.watch<TicTakProvider>().winner == FilledWith.x
                            ? "X WON"
                            : "O WON",
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        FilledWith insideContainer = elementMap[index]!;
                        return insideContainer == FilledWith.x
                            ? Container(
                                margin: const EdgeInsets.all(5),
                                width: 100,
                                height: 100,
                                color: const Color(0xff12161F),
                                child: const Center(
                                  child: Text(
                                    "x",
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                            : insideContainer == FilledWith.o
                                ? Container(
                                    margin: const EdgeInsets.all(5),
                                    width: 100,
                                    height: 100,
                                    color: const Color(0xff12161F),
                                    child: const Center(
                                      child: Text(
                                        "o",
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))
                                : GestureDetector(
                                    onTap: () {
                                      final stage =
                                          context.read<TicTakProvider>().stage;
                                      if (stage == FilledWith.x) {
                                        context
                                            .read<TicTakProvider>()
                                            .addX(index: index);
                                      } else if (stage == FilledWith.o) {
                                        context
                                            .read<TicTakProvider>()
                                            .addO(index: index);
                                      } else {
                                        context
                                            .read<TicTakProvider>()
                                            .startGame();
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      width: 100,
                                      height: 100,
                                      color: const Color(0xff12161F),
                                    ),
                                  );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
