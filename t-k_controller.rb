require_relative "./t-k_model.rb"
require_relative "./phone_book_view.rb"

class TelephonnayaController
  attr_reader :telephonnaya_model, :telephonnaya_view
  def initialize(file_path)
    @telephonnaya_model = ContactsBook.new(file_path)
    @telephonnaya_view = PhoneBookView.new
    @list = []
    @person = {}
    @command = ""
    @name = ""
  end

  def open
    @command = "Start"
    while @command != "Exit"
      input = @telephonnaya_view.display_help #=> returns string "<command>: <name(optional)>"
      input_array = input.split(":")
      @command = input_array[0].downcase
      @name = input_array[1].strip if input_array[1] != nil
      if @command == "display"
        display_list
      elsif @command == "search"
        display_person(@name)
      elsif @command == "add"
        add_contact(@name)
      elsif @command == "delete"
        delete_contact(@name)
      elsif @command == "exit"
        @telephonnaya_view.exit_tele_kniga
        exit
      else
        @telephonnaya_view.display_error
        @telephonnaya_view.display_help
      end
    end
  end

  def display_list
    @list = @telephonnaya_model.list_all_names
    @telephonnaya_view.display_list(@list)
  end

  def display_person name
    details = telephonnaya_model.find_by_name(name)
    for detail in details
      @telephonnaya_view.display_person_information(detail.name, detail.phone, detail.email)
    end
  end

  def add_contact name
    input_array = @telephonnaya_view.enter_phone_email
    phone = input_array[0]
    email = input_array[1]
    @telephonnaya_model.add_contact({name:name,phone:phone,email:email, group: nil})
  end

  def delete_contact name
    @telephonnaya_model.delete_contact_by_name(name)
  end

end
