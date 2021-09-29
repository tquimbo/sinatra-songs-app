class Song < ActiveRecord::Base
    belongs_to :user
    validates :name, :artist, :album, presence: :true
    validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
    validates :user_id, presence: :true
end
