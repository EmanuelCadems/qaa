require 'acceptance_helper'

resource 'V1::Questions', prefix: '/v1' do
  let(:asker) { create(:user, :asker) }
  let(:provider) { create(:user, :provider) }
  let(:tenant) { create(:tenant) }
  let(:public_question) { Question.not_private.first }

  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  before do
    create(:question, private: true)
    create_list(:question, 32)
  end

  context 'valid api_key' do
    before do
      header 'Authorization', "Token token=#{tenant.api_key}"
    end

    get '/v1/questions' do
      example_request 'index with a valid api_key' do
        questions = Question.not_private.includes(:asker, answers: :provider)
                            .limit(30)

        options = { include: [:answers] }

        expect(response_body)
          .to eq(QuestionSerializer.new(questions, options).serialized_json)
        expect(status).to eq(200)
      end
    end
  end

  context 'invalid api_key' do
    before do
      header 'Authorization', 'Token token=invalid'
    end

    get '/v1/questions' do
      example_request 'index with invalid api_key' do
        expect(status).to eq(401)
      end
    end
  end
end



