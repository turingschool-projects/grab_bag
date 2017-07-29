class FacebookService
  attr_reader :uid, :token, :conn

  def initialize(user)
    @uid = user.fb_id
    @token = user.token
    @conn = Faraday.new("https://graph.facebook.com/v2.10/")
  end

  def uploaded_photos_call
    photo_data = get_uploaded_pics[:data]
    photo_data << get_tagged_pics[:data]
    photo_data.flatten
  end

  def get_uploaded_pics
    get_url("#{@uid}/photos?type=uploaded&fields=created_time,from,id,images,name,link,place,comments{like_count,comment_count,message,likes,from},tags{id,name},reactions{id,name,username,type}&limit=1000&access_token=#{@token}")
  end

  def get_tagged_pics
    get_url("#{@uid}/photos?fields=created_time,from,id,images,name,link,place,comments{like_count,comment_count,message,likes,from},tags{id,name},reactions{id,name,username,type}&limit=1000&access_token=#{@token}")
  end

  def get_url(path)
    get_json(@conn.get(path))
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_data(user)
    self.new(user).uploaded_photos_call
  end
end
