module V1
  class QuestionsController < ApplicationController
    def index
      options = { include: [:answers] }

      q = Question.ransack(params[:q])
      questions = paginate q.result.not_private
                                   .includes(:asker, answers: :provider)

      render json: QuestionSerializer.new(questions, options).serialized_json
    end
  end
end
