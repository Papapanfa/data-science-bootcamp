# greeting
user_name <- readline("Please enter your name: ")
print(paste("Hello, '", user_name, "' Welcome to resturant"))
print(df_pizza)


# create data frame
df_pizza <- data.frame(
           id = 1:9,
           pizza_menus = c(rep("Ultimate Cheese",3),rep("Pepperoni",3),rep("BBQ",3)),
           size_pan = c("S","M","L"),
           pizza_price = c(10,12,15)
        )

final_price <- 0

flush.console()
more_order <- "y"
while (more_order == "y"){
    select_id <- as.integer(readline("Please select id (1-9) : "))
    amount <- as.integer(readline("How many do you want? : "))

    pizza_name <- df_pizza$pizza_menus[select_id]
    pizza_price <- df_pizza$pizza_price[select_id] * amount
    pizza_pan <- df_pizza$size_pan[select_id]
    final_price <- final_price + pizza_price

    print(paste("You ordered :", pizza_name, "Size :", pizza_pan, ", Amount: ",amount, "pcs"))
    print(paste("Total price is : ", final_price, "$"))

    more_order <- readline("Do you want order more? (y/n): ")

 print("Enjoy eating!")
}
