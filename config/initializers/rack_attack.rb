class Rack::Attack
  Rack::Attack.cache.store = Redis.new(host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'], db: ENV['REDIS_DB'],
    password: ENV['REDIS_PASSWORD'])

  limit_proc = proc do |req|
    if req.first_limit?
      req.first_limit
    else
      req.second_limit
    end
  end

  period_proc = proc do |req|
    if req.first_limit?
      req.first_period
    else
      req.second_period
    end
  end

  throttle("questions/tenant", limit: limit_proc , period: period_proc) do |req|
    if req.path == '/v1/questions' && req.get?
      req.env['HTTP_AUTHORIZATION']
    end
  end
end
