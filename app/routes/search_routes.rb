#user, slug
get '/search/users.json' do
  user_list = []

  all_users.each do |user|
    user_list.push( {
                      'value'  => user.handle,
                      'user'   => user.handle,
                      'tokens' => [user.handle]
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
                        'tokens' => [user.handle, list.title, list.slug, list.describe]
                      } ) if list.public?
    end
  end
  content_type :json
  list_list.to_json
end
