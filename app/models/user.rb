class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable #:registerable


  # Returns the user's first name
  def first_name
    name.split(' ').first
  end

  # Returns the user's last name
  def last_name
    name.split(' ').last
  end

  def two_names
    name.split(' ').length == 1 ? first_name : "#{first_name} #{last_name}"
  end
end
