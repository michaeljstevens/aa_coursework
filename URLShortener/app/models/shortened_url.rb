
require 'byebug'
class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :long_url, :uniqueness => true, :presence => true, length: { maximum: 1024 }
  validates :short_url, :uniqueness => true, :presence => true


  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: "Visit"

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :users

  has_many :taggings,
    primary_key: :id,
    foreign_key: :site_id,
    class_name: "Tagging"

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

  def self.random_code
    output = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(:short_url == output)
      output = SecureRandom.urlsafe_base64
    end

    output
  end

  def self.create_for_user_and_long_url!(user, long_url)
    create!(
    :long_url => long_url,
    :short_url => self.random_code,
    :user_id => user.id
    )
  end

  def num_clicks
    Visit.all.select { |v| v.short_url_id == id }.size
  end

  def num_uniques
    visitors.length
  end

  def num_recent_uniques
    Visit.where("created_at > ?", 10.minutes.ago )
  end

end
