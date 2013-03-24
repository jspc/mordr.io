require 'routes/login_routes'

get '/' do
  if session[:logged_in]
    erb :index
  else
    redirect '/login/'
  end
end
