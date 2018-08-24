class Question < ApplicationRecord
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'
  has_many :answers

  validates :name, presence: true

  delegate :name, prefix: true, to: :asker

  scope :not_private, -> { where(private: false) }
end
