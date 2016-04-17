########
#credits
########
#Hacked by Brian Nivens and Alan Valdez, April 14th 2016
#TTS Inventory Project

#############
#requirements
#############
# Create an Inventory Program that:
# 1. Lists several items
# 2. Allows a user to:
#   - select an item
#   - view the inventory count
#   - change the number (quantity) of the inventory
#   - delete the item altogether
#   - and/or change the name of an item
# 3. Create a new item and give te item an inventory count,
#     and have this item now show up in the list of items you can select.
# 4. Loops through until the user does not want to edit the list anymore.

##############
#the inventory
##############
#add more to it
animes = {"berserk": 1, "fistotns": 15, "onepiece": 10000, "deathnote": -1}

#################################
#methods
#################################
#a method to print the inventory
def print_inv(h)
  slot = 0
  puts "<~~~~~~~Inventory~~~~~~~>"
  puts "Slot\tAnime\t\tQuantity"
  h.each  do |key, value|
            puts "#{slot}\t #{key} \t#{value}"
            slot = slot + 1
          end
  puts "<~~~~~~~~~~~~~~~~~~~~~~~>"
end

def select_item
  print_inv(animes)
  
end
########################
#start of user interface
########################
system "clear"
puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"
puts "Welcome to Brian and Alan's Anime shop!"
puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"
#loop the choice prompt until the user wants to stop
choice = ""

begin
  puts "What can we do you for?"
  puts "Type (p) view our inventory"

  #######################
  #put other choices here
  #######################

  puts "Type (q) to quit shopping"

  #get user choice
  print "Your choice: "
  choice = gets.chop.downcase

  #activate inventory actions based on user input
  case choice
    when "p"
      puts "You selected (view inventory)"
      print_inv(animes)

      ###############################################
      #put a when and the code for each letter/choice
      ###############################################

    when "q"
      puts "You selected (quit shopping)"

    #catches an invalid user choice
    else
      puts "That is not a valid choice"
    end
end until choice == "q"
puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"
puts "Thanks for visiting Brian and Alan's Anime shop!"
puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"
