class Visit < ActiveRecord::Base
  validates :user_id, :short_url_id, :presence => true

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :shortened_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: "ShortenedUrl"
end
