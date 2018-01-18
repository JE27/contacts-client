require 'unirest'

url = "http://localhost:3000"

puts "Choose an option: "
puts"     [1] Show one contact"
puts"     [2] Show all contacts"

input_option = gets.chomp

if input_option == "1"
  url += "/one_contact_url"
elsif input_option == "2"
  url += "/all_contacts_url"

end

response = Unirest.get("url")
contact_data = response.body
puts JSON.pretty_generate(contact_data)