require 'byebug'
class TagTopic < ActiveRecord::Base
  has_many :taggings,
    primary_key: :key,
    foreign_key: :tag_id,
    class_name: "Tagging"

  has_many :sites,
    through: :taggings,
    source: :shortened_url

  def most_visited
    most_visited_count = 0
    most_visited_site = nil
    tags = Tagging.where("tag_id = ?", self.id).distinct
    sites = Hash.new(0)
    tags.each do |tag|
      site = tag.site_id
      count = Visit.where("short_url_id = ?", site).count
      if count > most_visited_count
        most_visited_count = count
        most_visited_site = site
      end
    end

    ShortenedUrl.where("id = ?", most_visited_site).first
  end

end
