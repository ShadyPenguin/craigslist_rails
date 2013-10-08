require 'bcrypt'
class User < ActiveRecord::Base
  has_many :posts

  include BCrypt

  def password=(secret)
    return if secret == ''
    @password = Password.create(secret)
    self.password_digest = @password
  end

  def password
    return unless password_digest
    @password ||= Password.new(self.password_digest)
  end


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil  
  end
end
