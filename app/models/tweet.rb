class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  validates :tweet_id, :uniqueness => :true;

  def self.get_and_store_tweets(user)
    timeline = Twitter.user_timeline(user.username)
    timeline.each do |tweet|
      self.create( content: tweet.text,
                    twitter_user_id: user.id,
                    tweet_id: tweet.id,
                    tweeted_at: tweet.created_at )
    end
    timeline
  end
end
