# Lets play pokeymans.
# We have our very own pokeymans that we have to take care of.

# SECTION ONE - EASY

# PART ONE - CREATING THE GAME LOOP


# I want to create a loop that will give me the option to train, catch or take care of my pokeymans.
# Each one of these actions count as one cycle of my loop. I want to be given the option of what action I want to do each cycle.

# PART TWO - INITIALIZE

# Each pokeymans I catch has a name, health, level, experience, happiness, hunger. 
# Maximum health points start out as a random number between 60 and 100.
# Level starts at 5...for now.
# Experience starts at 0.
# Happiness at 100 out of 100
# Hunger at 0 out of 100.

# PART THREE - FIRST INSTANCE

# I start with 1 pokeyman and his name is Larry. Let's focus on Larry first before we start catching more pokeymans.
# For now, each cycle will only affect Larry.

# PART FOUR - INSTANCE METHODS & THE PASSAGE OF TIME

# Training my pokeymans will increase their experience by a little and eventually they will level up. 
# Leveling up will increase their level by one and their maximum health
# Training will also decrease their happiness. If it gets to 0 then they won't train :(
# I can play with my pokeymans which will increase their happiness.
# Playing or training with my pokeymans will increase their hunger, if their hunger gets too high they lose health points and happiness.
# Feeding my pokeymans will decrease their hunger.
# Update our game loop so that each cycle, all of our pokeymans gain a bit of hunger
# While a pokeymans hunger is low, they will regain health points each cycle

# If a pokeymans health reaches zero, it dies.

# END OF SECTION ONE

# SECTION TWO - MEDIUM
# PART ONE - OTHER POKEYMANS

# Now I want to find and catch and battle with other pokeymans.
# I can only have 6 pokeymans at a time, if I catch another over 6 I have to let him go :(
# Lets keep it simple for now, each cycle will introduce random encounter with a unnamed pokeyman that is level 5

# If we decide to fight it, we gain a lot more experience but lose hp.
# How much do we lose? Lets say we lose the other pokeymans level multiplied by a random number between 0 and 5. 

# If we decide to catch it then we add it to our caught pokeymans, and this will create a new instance of Pokeymans
# Catching a pokeymans will increase a count of caught pokeymans by one, remember this cant go higher than 6.

# Now that we have more than one caught pokeymans, we need to change our loop to ask which pokeymans we are training/taking care of.