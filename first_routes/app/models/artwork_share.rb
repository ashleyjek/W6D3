# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord

    belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

    belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User

    def self.artwork_shares_for_user_id(user_id)
        self.where(viewer_id: user_id)
    end
end
