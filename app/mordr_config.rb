configure do
  enable :sessions

  redis = Redis.new
  MongoMapper.database = 'mordr'

  set :root,            Proc.new { File.join(File.dirname(__FILE__), '..') }
  set :session_secret,  redis.get( 'mordr.io-key')
  set :bind,            '0.0.0.0'
end
