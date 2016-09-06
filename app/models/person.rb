class Person < ApplicationRecord

  def comments
    comments = []
    rand(5).times do
      comments << (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    end
    comments
  end
end
