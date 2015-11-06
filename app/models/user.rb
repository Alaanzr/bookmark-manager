require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String
  property :email, String
  property :password_hash, String

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end
end
