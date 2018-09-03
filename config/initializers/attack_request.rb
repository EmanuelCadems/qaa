class Rack::Attack::Request < ::Rack::Request
  def api_keys
    Rack::Attack.cache.store.keys.select do |key|
      key.include?(env['HTTP_AUTHORIZATION'])
    end
  end

  def first_limit
    ENV['FIRST_LIMIT'].to_i
  end

  def first_period
    ENV['FIRST_PERIOD'].to_i.seconds
  end

  def second_limit
    ENV['SECOND_LIMIT'].to_i
  end

  def second_period
    ENV['SECOND_PERIOD'].to_i.seconds
  end

  def first_count
    Rack::Attack
      .cache
      .count("questions/tenant:#{env['HTTP_AUTHORIZATION']}", first_period)
  end

  def count_authorization
    if api_keys.count > 1
      api_key = api_keys.reverse.pop
      Rack::Attack.cache.store.read(api_key).to_i
    else
      first_count
    end
  end

  def first_limit?
    count_authorization < first_limit
  end
end
