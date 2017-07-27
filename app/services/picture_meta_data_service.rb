class PictureMetaDataService

  def initialize(exif_object, current_user, binary_id = nil)
    @exifr = exif_object
    @user = current_user
    @binary_id = binary_id.to_i
  end

  def collect
    info = MetaData.create!(width: exifr.width,
                  height: exifr.height,
                  model: exifr.model,
                  shutter_speed: exifr.exposure_time,
                  aperture: exifr.f_number,
                  user_id: @user.id)
    if gps_data? == true
      info.update_attributes(long: exifr.gps.longitude,
                              lat: exifr.gps.latitude)
    end
  end



  private
    attr_reader :exifr, :user, :binary_id

    def gps_data?
      exifr.gps == nil ? false : true
    end
end
