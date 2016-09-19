class Tagging < ActiveRecord::Base
  belongs_to :tag_topic,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: "TagTopic"

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :site_id,
    class_name: "ShortenedUrl"
end
