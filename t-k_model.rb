require 'csv'
class Contact
  def initialize(contact_hash)
    @name = contact_hash["name"]
    @phone = contact_hash["phone"]
    @email = contact_hash["email"]
    @group = contact_hash["group"]
    @contact_hash=contact_hash
  end
  def update_contact

  end
  def self.parse_contact(contact_array)
      contact_hash = Hash.new
       contact_hash["name"] = contact_array[0]
       contact_hash["phone"] = contact_array[1]
       contact_hash["email"] = contact_array[2]
       contact_hash["group"] =contact_array[3]
  end
  def  return_an_array
        contact_array = []
        contact_array << contact_hash["name"]
        contact_array << contact_hash["phone"]
        contact_array << contact_hash["email"]
        contact_array << contact_hash["group"]
        return contact_array
  end
end
class ContactsBook
  def initialize(filename)
    @file=TkBookFile.new(filename)
    @contacts=@file.parse
   end
   def add_contact(contact_hash)
      @contacts << Contact.new(contact_hash)
   end
   def delete_contact(id)
     contact_to_delete =@contacts[id-1]
     @contact.delete(contact_to_delete)
   end
   def
   end
end

class TkBookFile
  def initialize(file)
   @file = file
   @list = []
  end
  def parse
     CSV.foreach(@file) do |contact|
      @list << Contact.new(Contact.parse_contact(contact))
     end
     return @list
  end

  def add_line_to_file(line_in_array)
     # line_in_array=[]
     # line_in_array <<line
    CSV.open(@file, "a") do |csv|
       csv << line_in_array
    end
  end
  def rewrite
    CSV.open(@file, "wb") do |csv|
        for task in @list.tasks
            csv << task
         end
      end
  end
end
