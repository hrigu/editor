class Comment < ApplicationRecord
  belongs_to :person, counter_cache: true # http://guides.rubyonrails.org/association_basics.html
  belongs_to :user
end
