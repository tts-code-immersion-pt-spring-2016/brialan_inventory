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
# 3. Create a new item and give the item an inventory count,
#     and have this item now show up in the list of items you can select.
# 4. Loops through until the user does not want to edit the list anymore.

@animes = {"berserk": 1, "fistotns": 15, "onepiece": 10000, "deathnote": -1}
@selected_anime = ""


def print_inv
  system "clear"
  puts "<~~~~~~~~Inventory~~~~~~~~>"
  @animes.each {|key, value| puts "\t#{key}"}
  puts "<~~~~~~~~~~~~~~~~~~~~~~~~~>"
end

def select_item
  system "clear"
  selection = ""
  begin
    print_inv
    puts "<~~~~~~~~~Select~~~~~~~~~~>"
    puts "Which anime would you like?"
    puts "<~~~~~~~~~~~~~~~~~~~~~~~~~>"
    puts "Type the title to select or (q) to quit: "
    print "Your selection: "
    selection = gets.chomp
    if @animes.key? selection.to_sym
      @selected_anime = selection.to_sym
      puts "Selected anime: (#{@selected_anime})"
      select_menu
    else
      puts ""
      puts "!!! The anime (#{selection}) is not found !!!"
      puts ""
    end
  end until selection == "q"
end

def display_quantity
  if @animes[@selected_anime] == 1
    puts "There is (#{@animes[@selected_anime]}) copy of (#{@selected_anime})"
  else
    puts "There are (#{@animes[@selected_anime]}) copies of (#{@selected_anime})"
  end
end

def change_quantity
  display_quantity
  puts "What would you like to the quantity to be?"
  print "New quantity: "
  @animes[@selected_anime] = gets.chomp.to_i
  display_quantity
end

def remove_anime
  choice = ""
  begin
    puts "Are you sure you wish to remove #{@selected_anime}?"
    print "Type (y) or (n): "
    choice = gets.chomp.downcase
  end until choice == "y" || choice == "n"
  if choice == "y"
    @animes.delete @selected_anime
    print_inv
    @selected_anime = ""
  else
    puts "#{@selected_anime} will not be deleted"
  end
end

def rename_anime
  print "What name would you like to give #{@selected_anime}: "
  new_anime = gets.chomp.to_sym
  old_quantity = @animes[@selected_anime]
  @animes.delete @selected_anime
  @animes[new_anime] = old_quantity
  @selected_anime = new_anime
  print_inv
end

def add_anime
  print "Type of the name of the anime would you like to add: "
  new_anime = gets.chomp.to_sym
  puts ""
  print "Type the quantity of #{new_anime}: "
  new_quantity = gets.chomp
  @animes[new_anime] = new_quantity
  print_inv
end

def select_menu
  system "clear"
  choice = ""
  begin
    puts "<~~~~~~~~~~~~~~~~~Select Menu~~~~~~~~~~~~~~~~~>"
    puts "What do you want to do with (#{@selected_anime}?)"
    puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"
    puts "Type (v) to view the quantity"
    puts "Type (c) to change the quantity"
    puts "Type (r) to remove the anime from the inventory"
    puts "Type (rn) to rename the anime"
    puts "Type (q) to quit the select menu"
    puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"

    print "Your choice: "
    choice = gets.chomp.downcase
    case choice
    when "v"
      "You selected (view the quantity)"
      display_quantity
    when "c"
      puts "You selected (change the quantity)"
      change_quantity
    when "r"
      "You selected (remove an anime)"
      remove_anime
    when "rn"
      "You selected (rename an anime)"
      rename_anime
    when "q"
      "You selected (quit select menu)"
    else
      puts "(#{choice}) is not a valid choice"
    end
  end until choice == "q"
end

  system "clear"
  choice = ""
  begin
    puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~>"
    puts "Brian and Alan's Anime shop!"
    puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~>"
    puts "What can we do you for?"
    puts "Type (p) to view our inventory"
    puts "Type (s) to select an anime"
    puts "Type (a) to add an anime"
    puts "Type (q) to quit shopping"

    print "Your choice: "
    choice = gets.chop.downcase

    case choice
      when "p"
        puts "You selected (view inventory)"
        print_inv
      when "s"
        puts "You selected (select anime)"
        select_item
      when "a"
        puts "You selected (add anime)"
        add_anime
      when "q"
        puts "You selected (quit shopping)"
      else
        puts "(#{choice}) is not a valid choice"
      end
  end until choice == "q"
  puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"
  puts "Thanks for visiting Brian and Alan's Anime shop!"
  puts "<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>"
