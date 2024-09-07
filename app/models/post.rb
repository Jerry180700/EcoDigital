class Post < ApplicationRecord
  belongs_to :user

  # Validates title and body
  validates :title, presence: true
  validates :body, presence: true
end
