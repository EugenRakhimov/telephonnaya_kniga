require_relative "./t-k_model.rb"
require_relative "./t-k_view.rb"

get command from t-k_view
query t-k_model

class TelephonnayaController
  attr_reader :telephonnaya_model, :telephonnaya_view
  def initialize(file_path)
    @telephonnaya_model = TelephonnayaModel.new(file_path)
    @telephonnaya_view = TelephonnayaView.new
  end

  def open
    @telephonnaya_view.display_menu
  end

  def get_list
    @telephonnaya_model.get_list
  end

  def get_person first_name, last_name
    @telephonnaya_model.get_person(first_name, last_name)
  end

  def show_list
    list = get_contacts #=> array of hashes
    @telephonnaya_view.display_list
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
    input = @telephonnaya_view.get_delete_input


  end

  def display_help
    @telephonnaya_view.display_help
  end

end
