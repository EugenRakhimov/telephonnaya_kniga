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
end
class ContactsBook
  def initialize(filename)
    @file=filename
  end

end
