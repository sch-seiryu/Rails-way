class User < ApplicationRecord
  # validations
  validates :firstName, presence: true  # required
  validates :lastName, presence: true  # required
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }  # required; identify email? -> [1] active_record_validations#2.12 uniqueness, [2] URI in std lib.
  validates :password, presence: true, length: { in: 4..10 }, confirmation: true  # required length between [4, 10], entered twice(=confirmation), 
  # validates :country # optional

  # [G2Step18]<Append>~
  has_many :active_sessions, dependent: :destroy
  # ~[G2Step18]<Append>
end