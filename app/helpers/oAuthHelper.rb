Twitter.configure do |config|
  config.consumer_key = 'ak7s0KS6AocuwYhOUe3jw'
  config.consumer_secret = '2ocFsjAu9gXYr6iw01fuKfV6cwAFuGkuMZ6PPiBk'
  config.oauth_token = '613141454-81dy1ghCAtQSmBJeupD93CiZETQyJUE8UAvGh1GR'
  config.oauth_token_secret = 'DcOFqg3P4gyQxGddodCmzsNFZHxm1FDDFyGZHNhTg'
end

def get_timeline(username)
  timeline = Twitter.user_timeline(username)
end


