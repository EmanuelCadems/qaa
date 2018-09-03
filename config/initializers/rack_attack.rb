class Rack::Attack
  Rack::Attack.cache.store = Redis.new(host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'], db: ENV['REDIS_DB'],
    password: ENV['REDIS_PASSWORD'])


  throttle("questions/tenant", limit: ENV['SECOND_LIMIT'].to_i ,
    period: ENV['SECOND_PERIOD'].to_i.seconds) do |req|
    if req.first_count > req.first_limit &&
       req.path == '/v1/questions' && req.get?
      req.env['HTTP_AUTHORIZATION']
    end
  end
end
