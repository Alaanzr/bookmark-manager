require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String
  property :email, String
  property :password_hash, String
  property :password_hash_confirmation, String

  validates_confirmation_of :password_hash

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  attr_reader :password_hash_confirmation

end
