


  //List<String> words = []; Start with a list of any words you wish to add
  //choose random word from the list as the guessed word

import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'guess.dart';
String? guess_word;
void hangman(){
  Random random = new Random();
  List<String> words = ["hangman","flutter"];
  int randomNumber = random.nextInt(words.length+1);
  String guess_word = words[randomNumber];
  String answer = "_"*guess_word.length;
  String? guess;
  List<String> guessed_letters = [];
  int attempts = 5;
  print("Welcome to Hangman!");
  while(guess_word != answer){
    if(attempts!=0){
      print("Word: "+answer);
      print("Guessed letters: ");
      for(int i=0; i<guessed_letters.length; i++){
        print(guessed_letters[i]);
      }
      String str_attempts = attempts.toString();
      print("Attempts left: "+str_attempts);
      try{
          print("Enter your guess (a single letter): ");
          guess = stdin.readLineSync();
          if(guess==""){
            print("Write something!");
            continue;
          }
          else if(guessed_letters.contains(guess)){
            print("The letter is already used!");
            continue;
          }
          else if(guess!.contains("0")||guess.contains("1")||guess.contains("2")||guess.contains("3")||guess.contains("4")||guess.contains("5")||guess.contains("6")||guess.contains("7")||guess.contains("8")||guess.contains("9")){
            print("Type a Letter not a NUMBER!");
            continue;
          }
          else if(guess.length>1){
            print("Type only 1 letter!");
            continue;
          }
      }
      catch(e){
        print("error");
      }
      guessed_letters.add(guess!);
      guess = guess.trim().toLowerCase();
      print(getValidGuess(guess,guess_word));
      if(getValidGuess(guess,guess_word)=="Correct!"){
        for(int i=0; i<guess_word.length;i++){
          if(guess==guess_word[i]){
            answer = answer.replaceFirst("_", guess, i);
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
