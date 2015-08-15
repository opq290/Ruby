load("./contact.rb")
def phonebook()
  root = Contact.new("kato", "3130")
  add_contact(root, Contact.new("hamada", "9844"))
  add_contact(root, Contact.new("ikeda", "0866"))
  add_contact(root, Contact.new("mori", "0074"))
  add_contact(root, Contact.new("arima", "1095"))
  add_contact(root, Contact.new("yamada", "3063"))
  add_contact(root, Contact.new("kazama", "3063"))
  add_contact(root, Contact.new("masuda", "3063"))
  root
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
