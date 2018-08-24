class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :asker_name

  has_many :answers
end
