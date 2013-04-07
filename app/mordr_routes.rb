require 'routes/login_routes'
require 'routes/list_routes'
require 'routes/item_routes'
require 'routes/search_routes'

get '/' do
  if session[:logged_in]
    erb :index
  else
    redirect '/login/'
  end
end
