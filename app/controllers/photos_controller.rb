class PhotosController < ApplicationController
  def index
    @photos = uploaded_photos_call
  end

  def uploaded_photos_call
    get_data_call("https://graph.facebook.com/v2.10/#{ENV['my_fb_id']}/photos?type=uploaded&access_token=#{ENV['my_fb_token']}")
    # uploaded_photos_call(response_json[:paging][:next]) if response_json[:paging][:next]
  end

  def tagged_photos_call
    get_data_call("https://graph.facebook.com/v2.10/#{ENV['my_fb_id']}/photos&access_token=#{ENV['my_fb_token']}")
    # uploaded_photos_call(response_json[:paging][:next]) if response_json[:paging][:next]
  end

  def get_data_call(url)
    response = Faraday.get(url)
    response_json = JSON.parse(response.body, symbolize_names: true)
    response_json[:data].map do |photo|
      data_response = Faraday.get("https://graph.facebook.com/v2.10/#{photo[:id]}?fields=backdated_time,backdated_time_granularity,created_time,from,id,images,name,link,place,comments{like_count,comment_count,message,likes,from},tags{id,name},reactions{id,name,username,type}&access_token=#{ENV['my_fb_token']}")
      JSON.parse(data_response.body, symbolize_names: true)
    end
  end
end
