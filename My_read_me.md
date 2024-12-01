Part 5
In general, the processing speed for filtered data is faster relative to the nonpartitioned data.
According to the graph produced, there is a notable relationship between the speed of processing and the length of the data.
The graph shows a negative (downward) relationship, indicating that as the size of the data increases the speed time for processing reduces.

Part 6
What is the relationship between the time saved by using parquets and the size of the filtered data?
The time saved by using filtered data is relatively larger for smaller sized data than for larger ones. This is shown by the trend line for the difference between the two (in the middle) becoming flatter as the size of the data gets larger. For both data processing times, there is a positive relationship between the size of data. Notwithstanding, using the partitioned data derives higher time savings than simply using parquets.

Question 2
The python code describes a guessing game using a pre-constructed list of 5 stringed words. For input, the code prompts users to input the name of the list as well as any number they choose. This number is equivalent to the amount of attempts the user gets to guess the correct word. The code selects, from the listing, a random word for the user to guess while restricting the user to inputting only string characters of 5 length; any word that does not fit this description, the code generates an "invalid input" message and asks the user to try again. Upon satisfying this condition, the user is allowed to enter words of similar description in an attempt to guess the correct word. If the user gets it correctly, the code congratulates them, else it asks them to keep inputting until the number of attempts is 0 - also, for each try, users are made aware of the number of remaining attempts. Once remaining attempts is 0, the code sends a notification that the answer is not correct and that they lost and publishes the correct answer. 
