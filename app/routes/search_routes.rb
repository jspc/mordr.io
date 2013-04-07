#user, slug
get '/search/users.json' do
  user_list = []

  all_users.each do |user|
    user_list.push( {
                      'value'  => user.handle,
                      'user'   => user.handle,
                      'tokens' => [user.handle],
                    } )
  end
  content_type :json
  user_list.to_json
end

get '/search/lists.json' do
  list_list = []

  all_users.each do |user|
    all_lists( user.handle ).each do |list|
      list_list.push( {
                        'value'  => list.title,
                        'user'   => user.handle,
                        'slug'   => list.slug,
                        'tokens' => [user.handle, list.title, list.slug, list.describe],
                      } ) if list.public?
    end
  end
  content_type :json
  list_list.to_json
end

get '/search/' do
  erb :'search/search_get'
end

post '/search/' do
  @search_term = params[:search]
  @user_list   = []
  @list_list   = []

  all_users.each do |user|
    @user_list.push( user.handle ) if user.handle =~ /#{@search_term}/
    all_lists( user.handle ).each do |list|
      if list.title =~ /#{@search_term}/ or list.slug =~ /#{@search_term}/ or list.describe =~ /#{@search_term}/ or user.handle =~ /#{@search_term}/
        @list_list.push ( {
                            :handle => user.handle,
                            :slug   => list.slug,
                            :title  => list.title,
                          } ) if list.public?
      end
    end
  end
  erb :'search/search'

end
