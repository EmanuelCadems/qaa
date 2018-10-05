require 'acceptance_helper'

resource 'V1::Questions', prefix: '/v1' do
  let(:asker) { create(:user, :asker) }
  let(:provider) { create(:user, :provider) }
  let(:tenant) { create(:tenant) }
  let(:public_question) { Question.not_private.first.reload }

  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  before do
    create(:question, private: true)
    create_list(:question, 32)

    header 'Authorization', "Token token=#{tenant.api_key}"
  end

  get '/v1/questions' do
    example_request 'index' do
      questions = Question.not_private.includes(:asker, answers: :provider)
                          .limit(30)

      options = { include: [:answers] }

      expect(response_body)
        .to eq(QuestionSerializer.new(questions, options).serialized_json)
      expect(status).to eq(200)
    end
  end

  get '/v1/questions?page=2' do
    example_request 'pagination' do
      questions = Question.not_private.includes(:asker, answers: :provider)
                          .paginate(page: 2)

      options = { include: [:answers] }

      expect(response_body)
        .to eq(QuestionSerializer.new(questions, options).serialized_json)
      expect(status).to eq(200)
    end
  end

  get '/v1/questions?q[asker_name_matches]=:asker_name' do
    explanation 'This uses ransack gem. Check search-matchers in \
    https://github.com/activerecord-hackery/ransack#search-matchers'

    let(:asker_name) { public_question.asker_name }
    example_request 'filter by asker_name' do
      questions = [public_question]

      options = { include: [:answers] }

      expect(response_body)
        .to eq(QuestionSerializer.new(questions, options).serialized_json)
      expect(status).to eq(200)
    end
  end

  get '/v1/questions?q[name_matches]=:name' do
    let(:name) { public_question.name }
    example_request 'filter by name' do
      questions = [public_question]

      options = { include: [:answers] }

      expect(response_body)
        .to eq(QuestionSerializer.new(questions, options).serialized_json)
      expect(status).to eq(200)
    end
  end

  get '/v1/questions?q[name_matches]=:name' do
    let(:name) { 'cadems' }
    example_request 'filter by non-existent name' do
      expect(status).to eq(204)
    end
  end

  get '/v1/questions?q[answers_name_matches]=:answer_name' do
    let(:answer_name) { public_question.answers.first.name }
    example_request 'filter by answers_name' do
      questions = [public_question]

      options = { include: [:answers] }

      expect(response_body)
        .to eq(QuestionSerializer.new(questions, options).serialized_json)
      expect(status).to eq(200)
    end
  end

  get '/v1/questions?q[answers_provider_name_matches]=:provider_name' do
    let(:provider_name) { public_question.answers.first.provider_name }
    example_request 'filter by provider_name' do
      questions = [public_question]

      options = { include: [:answers] }

      expect(response_body)
        .to eq(QuestionSerializer.new(questions, options).serialized_json)
      expect(status).to eq(200)
    end
  end
end

