require 'unirest'

require_relative 'contacts_controller/contacts_controller'
require_relative  'contacts_models/contacts'

class Frontend

def run

  system "clear"


  puts "Welcome to your contacts. Choose an option: "
  puts"     [1] Show all contacts"
  puts"     [2] Select a contact"
  puts"     [2.1] Search for a contact"  
  puts"     [3] Create a contact"
  puts"     [4] Update a contact"
  puts"     [5] Delete a contact"

  input_option = gets.chomp

  if input_option == "1"
    contacts_index_action

  elsif input_option == "2"
   ontacts_create_action
  elsif input_option == "3"
    contacts_show_action

  elsif input_option == "4"
    contacts_update_action

  elsif input_option == "5"
    contacts_destroy_action
  
end

end
