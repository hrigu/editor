class Person < ApplicationRecord

  has_many :comments

  validates :s_n, :register_number, :first_name, :family_name, :lawyer, presence: true


end
