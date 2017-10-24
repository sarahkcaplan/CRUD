require 'bcrypt'

class User < ApplicationRecord

  include BCrypt

  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(form_password)
    @password = Password.create(form_password)
    self.password_hash = @password

  def self.authenticate(username, email, login_password)
    user = User.find(email: params[:email] )
    if user && user.password_hash == login_password
      true
    else
      nil
    end
  end
end
