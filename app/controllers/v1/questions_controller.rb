module V1
  class QuestionsController < ApplicationController
    before_action :authenticate, :track_requests

    def index
      options = { include: [:answers] }

      q = Question.ransack(params[:q])
      questions = paginate q.result.not_private
                                   .includes(:asker, answers: :provider)
      if questions.any?
        render json: QuestionSerializer.new(questions, options).serialized_json
      else
        render status: 204
      end
    end

    private

    def track_requests
      Rack::Attack.cache.store.incr "#{@current_tenant.id}:"\
        "request_counter:/v1/questions"
    end
  end
end
