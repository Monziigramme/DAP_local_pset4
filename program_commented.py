import random
#we create a list from which users can select a random word
mylist = [
    "apple", "brave", "crane", "drive", "eagle",
    "fable", "grape", "house", "input", "joker",
    "knife", "lemon", "mango", "nerve", "ocean"
]

#defining our function that requires as input a word from the list created and any number of choice
def myfunction1(mylist, mynumber2): 
    #sets variables that will be used later in the function/loop
    mystring1 = random.choice(mylist).lower() #changes string to lowercase
    mynumber1 = 0 

    print("Welcome!") #initial message after running code
    print(f"You have {mynumber2} attempts.") #notifies user that, based on the number inputted, they have an equal amount of attempts
    
    #indicates a while loop that allows users to guess the random word 
    while mynumber1 < mynumber2: 
        mystring2 = input("Enter your guess: ").lower().strip() #prompts user to enter guess
        
        #If number of strings in word is not 5, then invalid input will print
        if len(mystring2) != 5 or not mystring2.isalpha(): #ensures input has exactly 5 strings and only alphabets, no numeric
            print("Invalid input.") 
            continue #skips loop to next iteration
        
        mynumber1 = mynumber1 + 1 #keeps adding to loop until equal to the number of attempts
        
        if mystring2 == mystring1: #if guess = random string, prints congratulations
            print(f"Congratulations! You won in {mynumber1} attempts.")
            break
        else:
            #if guess is not correct, it continues until 
            mymessage = ''
            for i in range(5):
                if mystring2[i] == mystring1[i]:
                    mymessage = mymessage + mystring1[i]
                else:
                    mymessage = mymessage + '_' #prints blank (underscores) message if incorrect
            mynumber3 = mynumber2 - mynumber1 #keeps deducting until it mynumber3 = 0
            print(f"Wrong! Here's what you got right: {mymessage}")  
            print(f"You have {mynumber3} attempts left.")
    
    if mynumber1 == mynumber2: #when total number of attempts are reached, if unsuccessful it prints
        print(f"Sorry, you lost. The correct answer was: '{mystring1}'.")

myfunction1(mylist, 5) #Prompts user to submit the list created and a number that will be equal to total attempts
