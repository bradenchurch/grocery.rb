
# Display a menu in the console for the user to interact with.
# Create a default array of hashes that represent items at a grocery store.
# Create a menu option to add items to a user's grocery cart.
  # show items 
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.
# Zip it up and turn it in!



@items = [
  {item: "Fish", price: 8},
  {item: "Lettuce", price: 5},
  {item: "Beef", price: 6},
  {item: "Potatoes", price: 2} 
]

@shopping_cart = []

# MAIN MENU FOR USER SELECTION
def main_menu
  # main_menu
  puts 'Welcome to our grocery store!'
  puts 'what would you like to do?:'
  puts '1) Add Items to Cart'
  puts '2) Remove Items'
  puts '3) View Cart'
  puts '4) Total Cost'
  puts '5) Add Inventory'
  puts '6) Exit'

  user_input = gets.strip.to_i
  if user_input === 1
    add_items
  elsif user_input === 2
    remove_item
  elsif user_input === 3
    view_cart
  elsif user_input === 4
    total_cost
  elsif user_input === 5
    new_inventory
  elsif user_input === 6
    exit
  else 
    puts 'invaild input, try again'
    main_menu
  end
end

# ADDING ITEMS TO CART
def add_items
  puts "Add Items to cart"
  puts "Press 0 to return to main menu"
  @items.map { | grocery_item | 
    puts "#{grocery_item[:item]} $#{grocery_item[:price]}"
  }

  user_input = gets.strip.downcase
  if user_input === "fish" || user_input === "1"
    @shopping_cart << {item: "Fish", price: 8}
  elsif user_input === "lettuce" || user_input === "2"
    @shopping_cart << {item: "Lettuce", price: 5}
  elsif user_input === "beef" || user_input === "3"
    @shopping_cart << {item: "Beef", price: 6}
  elsif user_input === "potatoes" || user_input === "4"
    @shopping_cart << {item: "Potatoes", price: 2}
  elsif user_input === "0"
    main_menu #need to keep user in list to select multiple items!!!
  else 
    puts 'invalid input, try again'
    add_items
  end
  add_items
end 

# REMOVING ITEMS FROM THE USERS SHOPPING CART
def remove_item
  puts "Choose which items to remove from your cart"
  puts "Press 0 to return to main menu"
  puts "Press 9 to go to your cart"

  @shopping_cart.map { | grocery_item |
    puts "#{grocery_item[:item]}"
  }
  user_input = gets.strip.downcase
  if user_input === "fish"
    @shopping_cart.delete(item: "Fish", price: 8)
  elsif user_input === "lettuce" 
    @shopping_cart.delete(item: "Lettuce", price: 5)
  elsif user_input === "beef" 
    @shopping_cart.delete(item: "Beef", price: 6)
  elsif user_input === "potatoes" 
    @shopping_cart.delete(item: "Potatoes", price: 2)
  elsif user_input === "9"
    view_cart
  elsif user_input === "0"
    main_menu
  else
    puts "That's an invalid entry"
  end
 remove_item
end

# USER CAN VIEW THEIR CART
def view_cart
  puts "Your Shopping Cart"
  @shopping_cart.map { | grocery_item |
    puts "#{grocery_item[:item]} $#{grocery_item[:price]}"
}
main_menu 
end

# SUMS USERS CART
def total_cost
  puts "Cost"
  @shopping_cart.map { | grocery_item |
    puts "#{grocery_item[:item]} $#{grocery_item[:price]}"
  } 
  @total = 0 
  @shopping_cart.map { |grocery_item| 
    @total += grocery_item[:price]
  }
  puts "Total Cost: $#{@total}"
  puts "Press 0 to go to main menu"
  user_input = gets.to_i
  if user_input == 0
    main_menu
  end
  total_cost
end

# ADDS NEW INVENTORY TO STORE
def new_inventory
  puts "What item would like to add?"
    item = gets.strip
  puts "How much do you think it costs?"
    cost = gets.strip
  add_inventory = {:item =>item, :price =>cost }
    @items.push(add_inventory)
  main_menu
end


main_menu