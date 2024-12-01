
#we create a list from which users can select a random word
mylist <- c("apple", "brave", "crane", "drive", "eagle",
  "fable", "grape", "house", "input", "joker",
  "knife", "lemon", "mango", "nerve", "ocean")

#defining our function that requires as input a word from the list created and any number of choice
guess_the_word <- function(mylist, mynumber2) {
  #sets variables that will be used later in the function/loop
  mystring1 <- sample(mylist, 1) #chooses a random word
  mystring1 <- tolower(mystring1) #changes string to lowercase
  mynumber1 = 0 
  
  print("Welcome!") #initial message after running code
  print(paste("You have", mynumber2, "attempts.")) #notifies user that, based on the number inputted, they have an equal amount of attempts

#indicates a while loop that allows users to guess the random word 
  while (mynumber1 < mynumber2) { 
  guess <- tolower(trimws(readline(prompt = "Enter your guess: "))) #prompts user to enter guess
  
#If number of strings in word is not 5, then invalid input will print
  if (str_length(guess) != 5 || !str_detect(guess, "^[a-zA-Z]+$")) { #ensures input has exactly 5 strings and only alphabets, no numeric
    print("Invalid input.")
  next #skips loop to next iteration
  }
  
  mynumber1 <- mynumber1 + 1 #keeps adding to loop until equal to the number of attempts
       
  if (guess == mystring1) { #if guess = random string, prints congratulations
  print("Congratulations! You won in {mynumber1} attempts.")
    break
  } else {
     mymessage <- ""
    for (i in 1:5) {
      if (substr(guess, i, i) == substr(mystring1, i, i)) {
        mymessage <- paste0(mymessage, substr(mystring1, i, i))
      } else {
        mymessage <- paste0(mymessage, "_")
      }
    }
     mynumber3 <- mynumber2 - mynumber1
     print(paste("Wrong! Here's what you got right:", mymessage))
     print(paste("You have", mynumber3, "attempts left."))
  }
  
  # If the user exhausts all attempts
  if (mynumber1 == mynumber2) {
    print(paste("Sorry, you lost. The correct answer was:", mystring1))
  }
  }
}

guess_the_word(mylist, 5) #Prompts user to submit the list created and a number that will be equal to total attempts
