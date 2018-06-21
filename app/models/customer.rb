class Customer < User
  has_many :rides
  validates_presence_of :phone_no
end
