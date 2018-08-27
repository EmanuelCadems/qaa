module V1
  class QuestionsController < ApplicationController
    before_action :authenticate

    def index
      options = { include: [:answers] }

      q = Question.ransack(params[:q])
      questions = paginate q.result.not_private
                                   .includes(:asker, answers: :provider)
      if questions.any?
        render json: QuestionSerializer.new(questions, options).serialized_json
      else
        render status: 404
      end
    end
  end
end
