require 'time'

class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def self.store_tweets_if_stale(user)
    if Fetch.find_by_twitter_user_id(user.id)

      fetch = Fetch.find_or_create_by_twitter_user_id(user.id)
      fetch_time = fetch.updated_at
      current_time = Time.now
      recency = (current_time - fetch_time)/60

      fetch.update_attributes(updated_at: Time.now)

      if recency >= 15 
        get_and_store_tweets!(user)
      end
    else
      Fetch.create(twitter_user_id: user.id)
      get_and_store_tweets!(user)
    end
  end

  def self.get_and_store_tweets!(user)
    p "api call!"
    timeline = Twitter.user_timeline(user.username)
    timeline.each do |tweet|
      Tweet.create( content: tweet.text,
                   twitter_user_id: user.id,
                   tweet_id: tweet.id,
                   tweeted_at: tweet.created_at )
    end
  end

  def fetch_tweets
    self.tweets.limit(10)
  end

  def tweet_duration
    time1 = self.tweets.last.tweeted_at
  end
end
