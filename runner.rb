require 'unirest'

system "clear"


puts "Welcome to your contacts. Choose an option: "
puts"     [1] Show all contacts"
puts"     [2] Select a contact"
puts"     [3] Create a contact"
puts"     [4] Update a contact"
puts"     [5] Delete a contact"

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/contacts")
  contacts = response.body

  puts JSON.pretty_generate(contacts)
elsif input_option == "2"
  print "Enter recipe ID"

  input_id = gets.chomp

  response = Unirest.get("http://localhost:3000/contacts/#{{input_id}}")
  contacts = response.body

  puts JSON.pretty_generate(contacts)
elsif input_option == "3"
  client_params = {}

  print "First Name: "
  client_params[:first_name] = gets.chomp
  print "Middle Name: "
  client_params[:middle_name] = gets.chomp
  print "Last Name: "
  client_params[:last_name] = gets.chomp
  print "Email: "
  client_params[:email] = gets.chomp
  print "Phone number: "
  client_params[:phone_number] = gets.chomp
  print "Bio: "
  client_params[:bio] = gets.chomp
  
  response = Unirest.post(
                          "http://localhost:3000/contacts", 
                          parameters: client_params
    )
  conacts = response.body

  puts JSON.pretty_generate(contacts)

elsif input_option == "4"
  print "Enter Hot Sauce id: "
  input_id = gets.chomp

  response = Unirest.get("http://localhost:3000/contacts/#{{input_id}}")
    conacts = response.body

    client_params = {}

  print "First Name(#contacts["first_name"]}): "
  client_params[:first_name] = gets.chomp
  print "Middle Name(#contacts["middle_name"]}): "
  client_params[:middle_name] = gets.chomp
  print "Last Name(#contacts["last_name"]}): "
  client_params[:last_name] = gets.chomp
  print "Email(#contacts["email"]}): "
  client_params[:email] = gets.chomp
  print "Phone number(#contacts["phone_number"]}): "
  client_params[:phone_number] = gets.chomp
  print "Bio(#contacts["bio"]}): "
  client_params[:bio] = gets.chomp
  
  response = Unirest.patch(
                          "http://localhost:3000/contacts", 
                          parameters: client_params
    )
  conacts = response.body

  puts JSON.pretty_generate(contacts)

elsif input_option == "5"
  print "Enter Hot Sauce id:"
  input_id = gets.chomp

  response = Unirest.delete("http://localhost:3000/contacts/#{{input_id}}")
  contacts = response.body
  puts contacts["message"]
end








