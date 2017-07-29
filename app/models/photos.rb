class Photos

  def self.get_data(user)
    photo_data = FacebookService.get_data(user)
    photo_data.each do |photo|
      if MetaDataPhoto.find_by(fb_photo_id: photo[:id]) == nil

        if photo[:place]
          place = FbPlace.find_or_create_by(fb_place_id: photo[:place][:id]) do |place|
            place.name = photo[:place][:name]
            place.city = photo[:place][:location][:city] rescue nil
            place.country = photo[:place][:location][:country] rescue nil
            place.lat = photo[:place][:location][:latitude] rescue nil
            place.long = photo[:place][:location][:longitude] rescue nil
          end
        end
        meta_data = MetaDataPhoto.create!(image: photo[:images][0][:source],
                        created_time: photo[:created_time],
                        fb_uname: photo[:from][:name],
                        fb_uid: photo[:from][:id],
                        fb_photo_id: photo[:id],
                        fb_place_id: place.try(:id),
                        user_id: user.id
                        )

        if photo[:reactions]
          photo[:reactions][:data].each do |reaction|
            FbReaction.create(fb_uid: reaction[:id],
                              fb_uname: reaction[:name],
                              reaction_type: reaction[:type],
                              meta_data_photo_id: meta_data.id
                              )
          end
        end

        if photo[:tags]
          photo[:tags][:data].each do |tag|
            FbTag.create(fb_uid: tag[:id],
                          fb_uname: tag[:name],
                          meta_data_photo_id: meta_data.id
                          )
          end
        end

        if photo[:comments]
          photo[:comments][:data].each do |comment|
            FbComment.create(like_count: comment[:like_count],
                              comment_count: comment[:comment_count],
                              message: comment[:message],
                              fb_uname: comment[:from][:name],
                              fb_uid: comment[:from][:id],
                              meta_data_photo_id: meta_data.id
                              )
          end
        end

      end

    end
  end
end
