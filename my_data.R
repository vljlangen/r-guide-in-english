library(dplyr)

car_dataset <- mtcars

car_dataset2 <- car_dataset %>%                  # Let's process the dataset car_dataset.
                filter(carb > 1) %>%             # Keep only cars with more than 1 carburetor.
                mutate(fuel_cons = mpg,          # New variables with new names are created
                       horsepower = hp,          # on these four lines
                       mass = wt,                # (actually, were making duplicates
                       gear = am) %>%            # of the existing ones).
                select(fuel_cons,                # Keep only the variables we created,
                       horsepower,               # destroy all others.
                       mass,
                       gear)


# 1.
#
# Create a car with no mass defined.
# Thus, the mass automatically gets the value NA in R (not applicable, i.e. missing data).
# Store the entire new dataset as the dataset "car_dataset3":

car_dataset3 <- car_dataset2 %>%
  add_row(fuel_cons = 30.7,
          horsepower = 67,
          gear = 1)

#Let's name the last line (i.e. the car) "Lada":

row.names(car_dataset3)[nrow(car_dataset3)] <- "Лада"



# 2.
#
# The next car created will have the name "Trabant" that reflects the history of the GDR (DDR).
# The mass will be given a clearly incorrect value of 0 kilograms.
# The entire car dataset replaces the dataset "car_dataset3":

car_dataset3 <- car_dataset3 %>%
  add_row(fuel_cons = 34.6,
          horsepower = 23,
          mass = 0,
          gear = 1)

row.names(car_dataset3)[nrow(car_dataset3)] <- "Trabant"



# Delete any rows with either inadequate data or NA.
# Save a complete dataset by the name "car_dataset4":

car_dataset4 <- car_dataset3 %>%
  filter(fuel_cons > 0,
         horsepower > 0,
         mass > 0,
         gear %in% c(0,1))




# Let's start from the beginning: let's load mtcars.
# Note! Only when all the pipelined commands below have been run,
# the dataset is saved into a new dataset called "car_dataset5".
car_dataset5 <- mtcars %>%
  
  # Only cars with more than 1 carburetor are selected.
  filter(carb > 1) %>%
  
  # Use the mutate command to change the American units to European ones,
  # give the variables new names.
  mutate(fuel_cons_eu = 235.2 / mpg,
         horsepower_eu = hp / 0.9863,
         mass_eu = wt * 453.6,
         gear = am) %>%
  
  # With the Select command, only the new variables we created are
  # selected and thus preserved, all other variables will be destroyed.
  select(fuel_cons_eu,
         horsepower_eu,
         mass_eu,
         gear)


car_dataset5 <- car_dataset5 %>% mutate(gear = as.factor(gear))

car_dataset6 <- as_tibble(car_dataset5, rownames = "Car Brands")






