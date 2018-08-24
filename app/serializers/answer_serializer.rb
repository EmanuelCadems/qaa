class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :provider_name
end
