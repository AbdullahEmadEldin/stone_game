import 'dart:math';

final List<String> gameChoices = ['Sissor', 'Paper', 'Rock'];
final List<String> resultsOptions = ['draw', 'computer wins', 'player wins'];

abstract class GameLogicAPI {
  Future<String> randomComputerChoice(List<String> computerChoices);
  Future<String> gameResult({required String playerChoice});
}

class GameLogic implements GameLogicAPI {
  ///generate a random playCard for the PC player after the player select a card
  @override
  Future<String> randomComputerChoice(List<String> computerChoices) async {
    final random = Random();
    final stringResult = await Future.delayed(const Duration(seconds: 3), () {
      var element = computerChoices[random.nextInt(computerChoices.length)];
      return element;
    });
    return stringResult;
  }

  @override
  Future<String> gameResult({required String playerChoice}) async {
    final String compChoice = await randomComputerChoice(gameChoices);
    print('LOGIC inside::::::::::::: $compChoice');
    String result = '';
    if (compChoice == playerChoice) {
      result = resultsOptions[0];
    } else if ((compChoice == gameChoices[0] &&
            playerChoice == gameChoices[1]) ||
        (compChoice == gameChoices[1] && playerChoice == gameChoices[2]) ||
        (compChoice == gameChoices[2] && playerChoice == gameChoices[0])) {
      result = resultsOptions[1];
    } else if ((playerChoice == gameChoices[0] &&
            compChoice == gameChoices[1]) ||
        (playerChoice == gameChoices[1] && compChoice == gameChoices[2]) ||
        (playerChoice == gameChoices[2] && compChoice == gameChoices[0])) {
      result = resultsOptions[2];
    }
    return result;
  }
}
