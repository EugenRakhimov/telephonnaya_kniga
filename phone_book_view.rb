require './asciiart'

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
      p contact.first_name + " " + contact.last_name
    end
    p "*" * 17
  end

  def display_person_information(first_name, last_name, phone, email)
    p "Comrade: #{first_name} #{last_name}"
    p "Telephone: #{phone}"
    p "Internet: #{email}"
  end



  def display_instructions
    p "Welcome to TeleKniga, where comrade find you. The following commands are available:"
      p "Display: to parade the comrade list"
      p "Search: to hunt down your comrade"
      p "Add: to add a comrade"
      p "Delete: to eliminate an enemy in your list"
      p "Exit: to terminate the application"
  end

end #end of Class


class Person

  attr_accessor :first_name, :last_name, :email, :phone

  def initialize(args)
      @first_name = args[:first_name]
      @last_name = args[:last_name]
      @email = args[:email]
      @phone = args[:phone]
  end

end #end of Class


args = [Person.new(first_name:"Denis", last_name: "Tyurkov", email:"adnandn@gmail.com", phone:"0223128532"), Person.new(first_name:"Bob", last_name: "Simdksfs", email:"adnandn@gmail.com", phone:"0228532")]

new_phone = PhoneBookView.new

new_phone.display_list(args)

a = AsciiArt.new("/Desktop/Images/DSC_3812.jpg")
puts a.to_ascii_art


# new_contact = PhoneBookView.new(first_name:"Denis", last_name: "Tyurkov", email:"adnandn@gmail.com", phone:"0223128532")
# new_contact1 = PhoneBookView.new(first_name:"Bob", last_name: "Simdksfs", email:"adnandn@gmail.com", phone:"0228532")
# new_contact.display_person_information
# new_contact1.display_person_information
