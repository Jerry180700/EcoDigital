class Post < ApplicationRecord
  belongs_to :user

  # Validates title and body
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true, length: { minimum: 10 }
end
