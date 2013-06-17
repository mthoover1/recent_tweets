get '/' do
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  TwitterUser.store_tweets_if_stale(@user)
  @tweets = @user.fetch_tweets
  erb :tweets
end

post '/fetch' do
  redirect to "/#{params[:username]}"
end
