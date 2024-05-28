class Student < ApplicationRecord

  enum title: {
    "Mr." => 0,
    "Mrs." => 1
  }
  enum gender: {
    "Male" => 0,
    "Female" => 1
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
