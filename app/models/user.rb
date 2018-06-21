# User model
class User < ApplicationRecord
  validates_presence_of :name, :email, :password #,:message => "Please enter the"
  validates_uniqueness_of :email,
                          presence: true,
                          case_sensitive: false
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      on: :create
  before_create :encrypt_password

  def encrypt_password
    self.password = Digest::MD5.hexdigest(password) if password.present?
  end


  def self.find_or_create(attr, args = {})
    record = find_or_create_by(attr)
    record.update_attributes(args)
    record
  end
end
