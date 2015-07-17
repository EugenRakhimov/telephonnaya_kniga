require 'csv'
class Contact
  attr_reader :name, :phone, :email, :group
  def initialize(contact_hash)
    @name = contact_hash[:name]
    @phone = contact_hash[:phone]
    @email = contact_hash[:email]
    @group = contact_hash[:group]
    @contact_hash=contact_hash
  end
  def update_contact

  end
  def self.parse_contact(contact_array)
      contact_hash = Hash.new
       contact_hash[:name] = contact_array[0]
       contact_hash[:phone] = contact_array[1]
       contact_hash[:email] = contact_array[2]
       contact_hash[:group] = contact_array[3]
       return contact_hash
  end
  def  return_an_array
        contact_array = []
        contact_array << @contact_hash[:name]
        contact_array << @contact_hash[:phone]
        contact_array << @contact_hash[:email]
        contact_array << @contact_hash[:group]
        return contact_array
  end
end
class ContactsBook
  def initialize(filename)
    @file = TkBookFile.new(filename)
    @contacts = []
    @contacts = @file.parse
   end
   def add_contact(contact_hash)

       contact =Contact.new(contact_hash)
      @contacts << contact
      @file.add_line_to_file(contact.return_an_array)
   end
   def delete_contact(id)
     contact_to_delete = @contacts[id-1]
     @contacts.delete(contact_to_delete)
     @file.rewrite
   end
   def list_all_names
       return @contacts.sort{|x,y| x.name <=> y.name}
   end
   def find_by_name(name)
     return @contacts.select{|contact| contact.name == name}
   end
end

class TkBookFile
  def initialize(file)
   @file = file
   @list = []
  end
  def parse
    if File.file?(@file)
     CSV.foreach(@file) do |contact|
     contact_hash=Contact.parse_contact(contact)
      @list << Contact.new(contact_hash)
     end
    end
    return @list
  end

  def add_line_to_file(line_in_array)
     # line_in_array=[]
     # line_in_array <<line
     if File.file?(@file)
        CSV.open(@file, "a") do |csv|
           csv << line_in_array
         end
       else
        rewrite
       end
  end
  def rewrite
     CSV.open(@file, "wb") do |csv|
        for contact in @list
            csv << contact.return_an_array
         end
      end
  end
end

# telephones = ContactsBook.new("PhoneBook.csv")
# telephones.add_contact({name:"Eugene Rakhimov",phone:"0221704992",email:"gin3002@gmail.com", group: "Family"})
# telephones.add_contact({name:"Lani F",phone:"0221704992",email:"gin3002@gmail.com", group: "Family"})
# p telephones.find_by_name("Eugene Rakhimov")
# telephones.delete_contact(2)
# telephones.delete_contact(3)
# telephones.delete_contact(4)



