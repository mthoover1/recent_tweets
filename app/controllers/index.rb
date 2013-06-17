get '/' do
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  TwitterUser.store_tweets_if_stale(@user)
  @tweets = @user.fetch_tweets
  erb :tweets, :layout => false
end

post '/fetch' do
  redirect to "/#{params[:username]}"
end

get '/small_guy_finder/:username' do 
  @friends = Twitter.friends(params[:username])
  @small_guy_count = 9999999999
  @small_guy = nil
  @friends.each do |friend|
    friend_count = Twitter.followers(friend.name).count
    if friend_count < @small_guy_count
      @small_guy_count = friend_count
      @small_guy = friend
    end
  end

  erb :small_guy
end
