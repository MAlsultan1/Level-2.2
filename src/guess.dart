//this function tells the player if the guessed letter is correct or not
String getValidGuess(String guess, String guess_word) {
  if(guess_word.contains(guess)){
    return "Correct!";
  }
  else{
    return "Incorrect!";
  }
}