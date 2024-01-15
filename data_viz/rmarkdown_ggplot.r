library(tidyverse)

head(mpg)

# 1. Market Share
ggplot(mpg, aes(class, fill=class)) +
  geom_bar(alpha=.8) +
  labs(
    title="The most market share",
    subtitle = "By type",
    caption = "Data : mpg data",
    x="Class type",
    y="Number of class"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette="Paired")

# 2. Scatter plot of cyl vs. hwy, cyl vs. cty
d_hwy <- ggplot(mpg, aes(cyl, hwy)) +
  geom_point() +
  labs(x = "Miles per gallon",
       y = "Cylinders",
       title = "Highway vs. Cylinders") +
       theme_minimal()
d_cty <- ggplot(mpg, aes(cyl, cty)) +
  geom_point() +
  labs(x = "Miles per gallon",
       y = "Cylinders",
       title = "City vs. Cylinders") +
theme_minimal()


# 3. Histogram of the distribution of cylinders
ggplot(mpg, aes(cyl)) +
  geom_histogram() +
  labs(x = "Miles per gallon",
       y = "Cylinders",
       title = "City vs. Cylinders") +
theme_minimal()


# 4. Compare hit car before and after year 2000 by manufacturer
d_year1 <- mpg %>%
  filter(year >= 2000)
d_year2 <- mpg %>%
  filter(year < 2000)
ggplot(d_year1, aes(manufacturer, fill=manufacturer)) +
  geom_bar() +
  labs(x = "Manufacturer",
       title = "Car after year 2000") +
theme_minimal()

ggplot(d_year2, aes(manufacturer, fill=manufacturer)) +
  geom_bar() +
  labs(x = "Manufacturer",
       title = "Car before year 2000") +
theme_minimal()



# 5. Cty and Hwy
ggplot(mpg, aes(hwy, cty)) +
  geom_point(color="red") +
  geom_smooth(method="loess", se=TRUE,
  fill="green",
  color="blue") +
  labs(x = "Highway",
       y = "City",
       title = "City Highway") +
theme_minimal()

# Suggest car if you want both city and highway
sug_car <- mpg %>%
filter((hwy > 25 & hwy < 30) & (cty > 15 & cty < 20))
sug_car
