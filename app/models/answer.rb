class Answer < ApplicationRecord
  belongs_to :provider, class_name: 'User', foreign_key: 'user_id'
  belongs_to :question

  validates :name, presence: true

  delegate :name, prefix: true, to: :provider
end
