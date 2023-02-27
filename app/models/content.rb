class Content < ApplicationRecord
  belongs_to :user

  # validations
  validates :title, presence: true  # Title required
  validates :body, presence: true, length: { minimum: 10}  # Body required at least with 10 chars
end
