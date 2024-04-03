//imports libararies
import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'guess.dart';
//function hangman() contains all the code related with the actual game
void hangman(){
  Random random = new Random();//creating object of type random
  List<String> words = ["hangman","flutter"];//words for guessing
  int randomNumber = random.nextInt(words.length+1);//intializes a random number
  String guess_word = words[randomNumber];//picks a random word from the list
  String answer = "_"*guess_word.length;//create print statement with _ depending on guess word length
  String? guess;//nullable guess
  List<String> guessed_letters = [];//stores previous used letters
  int attempts = 5;//number of tries 
  print("Welcome to Hangman!");
  //loop for the main excution of code
  while(guess_word != answer){
    //if attempts not equal to 0 then print the current word and the guessed letters else the player loses and the program ends
    if(attempts!=0){
      print("Word: "+answer);
      print("Guessed letters: ");
      for(int i=0; i<guessed_letters.length; i++){
        print(guessed_letters[i]);
      }
      //converts number of attempts to string to print it
      String str_attempts = attempts.toString();
      print("Attempts left: "+str_attempts);
      //try-catch statement for catching input errors
      try{
        //input guess
          print("Enter your guess (a single letter): ");
          guess = stdin.readLineSync();
          //checks if it is empty
          if(guess==""){
            print("Write something!");
            continue;
          }
          //checks for duplicates
          else if(guessed_letters.contains(guess)){
            print("The letter is already used!");
            continue;
          }
          //checks if input is a number 
          else if(guess!.contains("0")||guess.contains("1")||guess.contains("2")||guess.contains("3")||guess.contains("4")||guess.contains("5")||guess.contains("6")||guess.contains("7")||guess.contains("8")||guess.contains("9")){
            print("Type a Letter not a NUMBER!");
            continue;
          }
          //checks if the input is more than 1 letter
          else if(guess.length>1){
            print("Type only 1 letter!");
            continue;
          }
      }
      catch(e){
        print("error!");
      }
      guessed_letters.add(guess!);//adds letter the list of guessed letters
      guess = guess.trim().toLowerCase();//trims and lower the input letter
      print(getValidGuess(guess,guess_word));//invokes getValidGuess imported for guess.dart
      //checks if the letter is correct then replace a blank _ with the specific index from the answer variable from the answer variable until a word is complete else decriment attempt
      if(getValidGuess(guess,guess_word)=="Correct!"){
        for(int i=0; i<guess_word.length;i++){
          if(guess==guess_word[i]){
            answer = answer.replaceFirst("_", guess, i);
            //checks if the answer matches with the guess word then prints a message for the player
            if(answer == guess_word){
              print("Congratulations! You guessed the word: "+guess_word);
            }
          }
        }
      }
      else{
        attempts = --attempts;
      }    
    }
    else{
      print("Sorry, you ran out of attempts. The correct word was: "+guess_word);
      break; 
    }
  }  
}
