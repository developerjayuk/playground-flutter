import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wurdle_game/providers/wurdle_provider.dart';
import 'package:wurdle_game/utils.dart';
import 'package:wurdle_game/widgets/keyboard_view.dart';
import 'package:wurdle_game/widgets/wurdle_view.dart';

class WurdlePage extends StatefulWidget {
  const WurdlePage({super.key});

  @override
  State<WurdlePage> createState() => _WurdlePageState();
}

class _WurdlePageState extends State<WurdlePage> {
  @override
  void didChangeDependencies() {
    Provider.of<WurdleProvider>(context, listen: false).init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wurdle')),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Consumer<WurdleProvider>(
                  builder: (context, provider, child) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                    itemCount: provider.wurdleBoard.length,
                    itemBuilder: (context, index) {
                      final wurdle = provider.wurdleBoard[index];

                      return WurdleView(wurdle: wurdle);
                    },
                  ),
                ),
              ),
            ),
            Consumer<WurdleProvider>(
              builder: (context, provider, child) => KeyboardView(
                excludedLetters: provider.excludedLetters,
                onPressed: (value) {
                  provider.inputLetter(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Consumer<WurdleProvider>(
                builder: (context, provider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        provider.deleteLetter();
                      },
                      child: Row(
                        children: [Icon(Icons.delete), Text('  Delete')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!provider.isAValidWord) {
                          showMessage(context, 'Not in our Dictionary');
                          provider.resetRow();
                        }

                        if (provider.allRowFilled) {
                          // check the answer
                          provider.checkAnswer();

                          if (provider.winner) {
                            showResult(
                              context: context,
                              title: 'Winner',
                              body:
                                  '${provider.targetWord} was the Answer! You are a genius!',
                              onPlayAgain: () {
                                Navigator.pop(context);
                                provider.resetGame();
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            );
                          } else if (provider.noAttemptsLeft) {
                            showResult(
                              context: context,
                              title: "Game Over - you lost!",
                              body:
                                  'The correct word was ${provider.targetWord}',
                              onPlayAgain: () {
                                Navigator.pop(context);
                                provider.resetGame();
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            );
                          }

                          //
                        }
                      },
                      child: Row(
                        children: [Icon(Icons.send), Text('  Submit')],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
