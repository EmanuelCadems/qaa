class Question < ApplicationRecord
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'
  has_many :answers

  validates :name, presence: true
end
