module ContactsController
  def contacts_index_action
    response = Unirest.get("http://localhost:3000/contacts")
    contacts = response.body

    puts JSON.pretty_generate(contacts)
    
  end

  def contacts_create_action
    print "Enter contact ID"

    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
    contacts = response.body

    puts JSON.pretty_generate(contacts)
  end

  def contacts_show_action
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
    
    if response.body == 200
      conacts = response.body
      puts JSON.pretty_generate(contacts)
    else 
      errors = response.body["errors"]
      errors.each do |error|
        puts error
      end
    end
  end

  def contacts_update_action
    print "Enter Contact id: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
      conacts = response.body

      client_params = {}

    print "First Name(#contacts[first_name]}): "
    client_params[:first_name] = gets.chomp
    print "Middle Name(#contacts[middle_name]}): "
    client_params[:middle_name] = gets.chomp
    print "Last Name(#contacts[last_name]}): "
    client_params[:last_name] = gets.chomp
    print "Email(#contacts[email]}): "
    client_params[:email] = gets.chomp
    print "Phone number(#contacts[phone_number]}): "
    client_params[:phone_number] = gets.chomp
    print "Bio(#contacts[bio]}): "
    client_params[:bio] = gets.chomp
    
    response = Unirest.patch(
                            "http://localhost:3000/contacts", 
                            parameters: client_params
      )
    
    if response.body == 200
      conacts = response.body
      puts JSON.pretty_generate(contacts)
    else 
      errors = response.body["errors"]
      errors.each do |error|
        puts error
      end
    end

  end

  def contacts_destroy_action
      print "Enter Contact id:"
      input_id = gets.chomp

      response = Unirest.delete("http://localhost:3000/contacts/#{input_id}")
      contacts = response.body
      puts contacts["message"]
    end
  end
end