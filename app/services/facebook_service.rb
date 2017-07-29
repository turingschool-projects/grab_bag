class FacebookService

  def self.get_data(user)
    self.uploaded_photos_call(user)
  end

  def self.uploaded_photos_call(user)
    response = Faraday.get("https://graph.facebook.com/v2.10/#{user.fb_id}/photos?type=uploaded&fields=created_time,from,id,images,name,link,place,comments{like_count,comment_count,message,likes,from},tags{id,name},reactions{id,name,username,type}&access_token=#{user.token}")
    response_json = JSON.parse(response.body, symbolize_names: true)[:data]
    # uploaded_photos_call(response_json[:paging][:next]) if response_json[:paging][:next]
  end

  # def tagged_photos_call
  #   get_data_call("https://graph.facebook.com/v2.10/#{ENV['my_fb_id']}/photos&access_token=#{ENV['my_fb_token']}")
  #   uploaded_photos_call(response_json[:paging][:next]) if response_json[:paging][:next]
  # end
end
