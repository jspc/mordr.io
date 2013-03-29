
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

    @owner = true if session[:handle] == params[:user]
    if @owner || @mlist.public?
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

get '/console/:slug/delete/' do
  if find_list( session[:handle], params[:slug] )
    del_list session[:handle], params[:slug]
  end
  redirect '/console/'
end

get '/console/:id/edit/' do
  if @mlist = find_list_by_id( session[:handle], params[:id] )
    @paid = has_paid?( session[:handle] )
    erb :'lists/edit_list'
  else
    @err = "You don't have permissions to edit this list"
    erb :error
  end
end

post '/console/:id/edit/' do
  if mlist = find_list_by_id( session[:handle], params[:id] )
    paid = has_paid?( session[:handle] )
    unless mlist.title == params[:title]
      rename_list session[:handle], mlist._id, params[:title]
    end
    unless mlist.describe == params[:desc]
      update_description session[:handle], mlist._id, params[:desc]
    end
  end
  slug = find_list_by_id( session[:handle], params[:id] ).slug
  redirect "/#{session[:handle]}/#{slug}/"
end
