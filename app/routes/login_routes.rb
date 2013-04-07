
get '/login/' do
  erb :'login/login'
end

post '/login/' do
  handle   = params[:handle]
  password = params[:password]

  if can_login? handle, password
    session[:logged_in] = true
    session[:handle]    = handle
    session[:gravatar]  = hashed_mail( handle )
    redirect "/#{handle}/"
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
    session[:gravatar]  = hashed_mail( handle )
    redirect "/#{handle}/"
  else
    @err = "We couldn't sign you up with those details"
    erb :error
  end
end

get '/:user/' do
  if @user = find_user( params[:user] )
    @lists = all_lists params[:user]
    erb :'login/console'
  else
    @err = "User '#{params[:user]}' does not exist"
    erb :error
  end
end
