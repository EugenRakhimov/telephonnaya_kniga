# require './asciiart'

class PhoneBookView

  # attr_accessor :first_name, :last_name, :email, :phone

  # def initialize(args)
  #     @first_name = args[:first_name]
  #     @last_name = args[:last_name]
  #     @email = args[:email]
  #     @phone = args[:phone]
  # end

  def display_list(args)
    p "The Comrade List:"
    p "*" * 17
    args.each do |contact|
      p contact.name
    end
    p "*" * 17
  end

  def display_person_information(name, phone, email)
    p "*" * 27
    p "Comrade:   #{name}"
    p "Telephone: #{phone}"
    p "Internet:  #{email}"
    p "*" * 27
  end

  def not_found
    p "Your comrade is missing in action!"
    # artii 'Art!'
  end

  def display_error
    p "Command not found"
  end

  def display_help
    p "Welcome to TeleKniga, where comrades find you!"
    puts
    p "*"*46
    p "*************** ""Hello General!"" ***************"
    p "*"*46
        puts
    p "The following commands are available:"
    p "*"*46
      p " Display:  to parade the comrade list"
      p " Search:   *Full Name* to hunt down comrade"
      p " Add:      *Full Name* to add a comrade"
      p " Delete:   *Full Name* to eliminate your enemy"
      p " Exit:     to terminate the application"
    p "*"*46
    p "Enter your command General!"
    input = gets.chomp
  end

  def enter_phone_email
    details_arr = []
    p "Comrade name registered, now enter telephone. DO IT NAUUU"
    telephone = gets.chomp
    details_arr << telephone
    p "Excellent, beep boop, now enter zie Internet"
    internet = gets.chomp
    details_arr << internet
  end


  def exit_tele_kniga
    p "I'll be back!"
  end

end #end of Class


# class Person

#   attr_accessor :first_name, :last_name, :email, :phone

#   def initialize(args)
#       @first_name = args[:first_name]
#       @last_name = args[:last_name]
#       @email = args[:email]
#       @phone = args[:phone]
#   end

# end #end of Class


# args = [Person.new(first_name:"Denis", last_name: "Tyurkov", email:"adnandn@gmail.com", phone:"0223128532"), Person.new(first_name:"Bob", last_name: "Simdksfs", email:"adnandn@gmail.com", phone:"0228532")]

# new_phone = PhoneBookView.new

# new_phone.display_list(args)



# a = AsciiArt.new("/Desktop/Images/DSC_3812.jpg")
# puts a.to_ascii_art


# new_contact = PhoneBookView.new(first_name:"Denis", last_name: "Tyurkov", email:"adnandn@gmail.com", phone:"0223128532")
# new_contact1 = PhoneBookView.new(first_name:"Bob", last_name: "Simdksfs", email:"adnandn@gmail.com", phone:"0228532")
# new_contact.display_person_information
# new_contact1.display_person_information

# new_contact.display_help
# new_contact.not_found
# new_contact.enter_phone_email
