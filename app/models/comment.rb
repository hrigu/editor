class Comment < ApplicationRecord
  belongs_to :person, counter_cache: true # http://guides.rubyonrails.org/association_basics.html
  belongs_to :user

  validates :content, :author, :person_id, :user_id, presence: true

  auto_strip_attributes :content, :author

end
