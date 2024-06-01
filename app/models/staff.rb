class Staff < ApplicationRecord

  enum title: {
    "Mr." => 0,
    "Mrs." => 1,
    "Dr." => 2
  }
  enum gender: {
    "Male" => 0,
    "Female" => 1
  }
  enum marital_status: {
    "Single." => 0,
    "Married" => 1,
    "Divorced" => 2
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :title , inclusion: titles.keys
  validates :gender , inclusion: genders.keys
  validates :marital_status , inclusion: marital_statuses.keys

  has_many :staff_subjects
  has_many :subjects, through: :staff_subjects

  
end
