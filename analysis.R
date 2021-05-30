library(tidyverse)
library(patchwork)

ranking <- read.csv("top-talk-show.csv")
result <- read.csv("talkshow_result.csv")

result_first <- result %>% 
  filter(grepl("First", Test)) 

result_second <- result %>% 
  filter(grepl("Second", Test))

plot_of_first_test <- ggplot(result_first, aes(x = Test, y = Count, 
                                               label = Count)) +
  geom_col(fill = "blue", alpha = 0.3) +
  geom_text(size = 5, vjust = 1, colour = "yellow") +
  labs(
    title = "Result of the First Test",
    x = "Test Result",
    y = "Numbers of the Talk Show"
  )

plot_of_second_test <- ggplot(result_second, aes(x = Test, y = Count, 
                                                 label = Count)) +
  geom_col(fill = "yellow", alpha = 0.3) +
  geom_text(size = 5, vjust = 1, colour = "purple") +
  labs(
    title = "Result of the Second Test",
    x = "Test Result",
    y = "Numbers of the Talk Show"
  )

plot_test <- plot_of_first_test + plot_of_second_test
