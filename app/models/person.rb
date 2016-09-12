class Person < ApplicationRecord

  has_many :comments, -> { order 'id desc' }

  validates :s_n, :register_number, :first_name, :family_name, :lawyer, presence: true

  auto_strip_attributes :first_name, :family_name, :lawyer, :contact_persons


end
