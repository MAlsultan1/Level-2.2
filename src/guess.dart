String getValidGuess(String guess, String guess_word) {
  if(guess_word.contains(guess)){
    return "Correct!";
  }
  else{
    return "Incorrect!";
  }
}