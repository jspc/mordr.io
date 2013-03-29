
post '/console/:slug/add_item/' do
  if add_item( session[:handle], params[:slug], params[:item_text], params[:item_desc] )
    redirect "/#{session[:handle]}/#{params[:slug]}/"
  else
    @err = "This handle and list do not exist in this configuration"
    erb :error
  end
end

get '/console/:slug/delete/:id/' do
  if delete_item session[:handle], params[:slug], params[:id]
    redirect "/#{session[:handle]}/#{params[:slug]}/"
  else
    @err = "Couldn't selete task"
    erb :error
  end
end

get '/console/:slug/complete/:id/' do
  if set_done session[:handle], params[:slug], params[:id]
    redirect "/#{session[:handle]}/#{params[:slug]}/"
  else
    @err = "Couldn't set task as done"
    erb :error
  end
end

get '/console/:slug/uncomplete/:id/' do
  if set_not_done session[:handle], params[:slug], params[:id]
    redirect "/#{session[:handle]}/#{params[:slug]}/"
  else
    @err = "Couldn't set task as not done"
    erb :error
  end
end
