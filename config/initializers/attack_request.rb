class Rack::Attack::Request < ::Rack::Request
  def first_limit
    ENV['FIRST_LIMIT'].to_i
  end

  def first_period
    ENV['FIRST_PERIOD'].to_i.seconds
  end

  def first_count
    Rack::Attack
      .cache
      .count("questions/tenant:#{env['HTTP_AUTHORIZATION']}", first_period)
  end


  def first_limit?
    first_count < first_limit
  end
end
