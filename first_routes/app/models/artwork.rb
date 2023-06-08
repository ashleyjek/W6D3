# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true 

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    def self.artworks_for_user_id(user_id)
        self.where(artist_id: user_id)
    end
     
end
