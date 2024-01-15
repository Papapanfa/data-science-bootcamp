game <- function() {
    # Welcome
    username <- readline("What's your name?: ")
    #print(paste("Welcome player: ", username, ", have a good luck!!"))

    # Start with both score is 0
    player_score <- 0
    bot_score <- 0
    hands <- c("hammer", "scissor", "paper")


    while (TRUE) {

        # both are choosed
        player_hand <- readline("Please choose one (hammer, scissor, paper) or quit : ")
        bot_hand <- sample(hands,1)

        # Draw case
        if ( player_hand == bot_hand ) {
            print(paste("You : ", player_hand))
            print(paste("Bot : ", bot_hand))
            print("Draw")
            print(paste("You score : ", player_score, "VS", "Bot score : ", bot_score))
        }
        # lose case
        else if ( (player_hand == "hammer" & bot_hand == "paper") |
                  (player_hand == "scissor" & bot_hand == "hammer") |
                  (player_hand == "paper" & bot_hand == "scissor")) {
                    print(paste("You : ", player_hand))
                    print(paste("Bot : ", bot_hand))
                    print("You losed")
                    bot_score = bot_score + 1
                    print(paste("You score : ", player_score, "VS", "Bot score : ", bot_score))
                  }
        # Win case
        else if ( (bot_hand == "hammer" & player_hand == "paper") |
                  (bot_hand == "scissor" & player_hand == "hammer") |
                  (bot_hand == "paper" & player_hand == "scissor")) {
                    print(paste("You : ", player_hand))
                    print(paste("Bot : ", bot_hand))
                    print("You Win")
                    player_score = player_score + 1
                    print(paste("You score : ", player_score, "VS", "Bot score : ", bot_score))
                  }

    flush.console()
    if(player_hand == "quit" & player_score > bot_score ) {
        print(paste("You score is : ", player_score))
        print(paste("Bot score is : ", bot_score))
        print("Game is over --> You Win!")
        break}
        else if (player_hand == "quit" & player_score < bot_score ) {
        print(paste("You score is : ", player_score))
        print(paste("Bot score is : ", bot_score))
        print("Game is over --> You lose!")
        break}

    # conclusion
    if( player_score == 3 ) {print("You Win!")
    } else if( bot_score == 3 ){pprint("You Lose!")}
    }

}

game()
