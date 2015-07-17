require_relative "./t-k_model.rb"
require_relative "./phone_book_view.rb"

class TelephonnayaController
  attr_reader :telephonnaya_model, :telephonnaya_view
  def initialize(file_path)
    @telephonnaya_model = ContactsBook.new(file_path)
    @telephonnaya_view = TelephonnayaView.new
    @list = []
    @person = {}
    @command = ""
    @name = ""
  end

  def open
    input = @telephonnaya_view.display_help #=> returns string "<command>: <name(optional)>"
    input_array = input.split(":")
    @command = input_array[0]
    @name = input_array[1].strip

    if @command == "Display"
      display_list
    elsif @command == "Search"
      display_person(@name)
    elsif @command == "Add"
      add_contact(@name)
    elsif @command == "Delete"
      delete_contact(@name)
    elsif @command == "Exit"
      exit
    else
      @telephonnaya_view.display_error
      @telephonnaya_view.display_help
    end

  end

  def display_list
    @list = @telephonnaya_model.list_all_names
    @telephonnaya_view.display_list(@list)
  end

  def display_person name
    details = telephonnaya_model.find_by_name(name)
    @telephonnaya_view.display_person_information(details)
  end

  def add_contact name
    input = @telephonnaya_view.get_add_details
    input_array = input.split("")
    phone = input_array[0]
    email = input_array[1]
    @telephonnaya_model.add_person(name, phone, email)
  end

  def delete_contact name
    @telephonnaya_model.delete_contact(name)
  end

end
