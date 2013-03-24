
get '/login/' do
  erb :'login/login'
end

post '/login/' do
  handle   = params[:handle]
  password = params[:password]

  if can_login? handle, password
    session[:logged_in] = true
    session[:handle]    = handle
    redirect '/console/'
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
  erb :'login/signup'
end

post '/signup/' do
  handle    = params[:handle]
  password  = params[:password]
  email     = params[:email]

  if new_user handle, password, email
    session[:logged_in] = true
    session[:handle]    = handle
    redirect '/'
  else
    @err = "We couldn't sign you up with those details"
    erb :error
  end
end

get '/console/' do
  if not session[:logged_in]
    redirect '/'
  else
    @user  = session[:handle]
    @lists = all_lists @user
    erb :'login/console'
  end
end
