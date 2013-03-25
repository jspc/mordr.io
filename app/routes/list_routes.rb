
get '/create/' do
  if session[:logged_in] == true
    @user = session[:handle]
    erb :'lists/new_list'
  else
    redirect '/login/'
  end
end

post '/create/' do
  if session[:logged_in] == true
    user  = session[:handle]
    title = params[:title]
    desc  = params[:desc]

    slug = new_list user, title, desc
    redirect "/#{user}/#{slug}/"
  else
    redirect '/login/'
  end
end

post '/delete/' do
    if session[:logged_in] == true
      user = session[:handle]
      slug = params[:slug]

      del_list handle, slug
      redirect '/console/'
    else
      redirect '/login/'
    end
end

get '/:user/:slug/' do
  if @mlist = find_list( params[:user], params[:slug] )
    if session[:handle] == params[:user] || @list.public?
      @user = params[:user]
      erb :'lists/list'
    else
      @err = "You haven't the necessary permissions to view this list"
      erb :error
    end
  else
    @err = "This user/ list combination doesn't exist"
    erb :error
  end
end

