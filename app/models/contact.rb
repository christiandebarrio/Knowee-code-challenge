class Contact < ActiveRecord::Base
  validates :first_name, :last_name, :email, :incorporation_date, presence: true
  validates :unsubscribe, inclusion: { in: [true, false] }

  def self.import
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open './app/assets/excel/adressbook.xls'
    sheet = book.worksheet 0

    sheet.each 1 do |row|
      contact = Contact.new
      contact.first_name = row[0]
      contact.last_name = row[1]
      contact.email = row[2]
      contact.incorporation_date = row[3]
      contact.unsubscribe = unsubscribe_to_boolean(row[4])
      contact.save
    end
  end

  def self.unsubscribe_to_boolean data
    data.downcase == "si" ? true : false
  end
end
