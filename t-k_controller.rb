require_relative "./t-k_model.rb"
require_relative "./phone_book_view.rb"

class TelephonnayaController
  attr_reader :telephonnaya_model, :telephonnaya_view
  def initialize(file_path)
    @telephonnaya_model = TelephonnayaModel.new(file_path)
    @telephonnaya_view = TelephonnayaView.new
    @list = []
    @person = {}
    @command = ""
    @name = ""
  end

  def open
    input = @telephonnaya_view.display_help #=> returns string "<command>: <name(optional)"
    input_array = input.split(":")
    @command = input_array[0]
    @name = input_array[1].strip
  end

  def get_list
    @list = @telephonnaya_model.list_all_names
  end

  def find_by_name name
    @telephonnaya_view.get_person
    @telephonnaya_model.find_by_name(name)
  end

  def show_list
    @list = get_list #=> array of hashes
    @telephonnaya_view.display_list(@list)
  end

  def show_details
    get_person
    @telephonnaya_view.display_person_information(first_name, last_name, phone, email)
  end

  def add_contact
    input = @telephonnaya_view.get_add_input
    input_array = input.split("")
    first_name = input_array[0]
    last_name = input_array[1]
    phone = input_array[2]
    email = input_array[3]
    @telephonnaya_model.add_person(first_name, last_name, phone, email)
  end

  def delete_contact
    contact_id = @telephonnaya_view.get_delete_input
    @telephonnaya_model.delete_contact(contact_id)
  end


  end

  def display_help
    @telephonnaya_view.display_help
  end

end
