
get '/' do
  if session[:logged_in]
    erb :index
  else
    redirect '/login/'
  end
end

get '/login/' do
  erb :login
end

post '/login/' do
  handle   = params[:handle]
  password = params[:password]

  if self.can_login? handle, password
    session[:logged_in] = true
    redirect '/'
  else
    @err = "Username and Password combination didn't match the thing"
    erb :error
  end
end

get '/logout/' do
  session.clear
  redirect '/'
end

get '/signup/' do
  erb :signup
end

post '/signup/' do
  handle    = params[:handle]
  password  = params[:password]
  email     = params[:email]

  if self.new_user handle, password, email
    session[:logged_in] = true
    redirect '/'
  else
    @err = "We couldn't sign you up with those details"
    erb :error
  end
end
