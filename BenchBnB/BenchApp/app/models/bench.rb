class Bench < ActiveRecord::Base

  def self.in_bounds(bounds)
    if bounds
      self.where("lat < ?", bounds[:northEast][:lat])
          .where("lat > ?", bounds[:southWest][:lat])
          .where("lng > ?", bounds[:southWest][:lng])
          .where("lng < ?", bounds[:northEast][:lng])
    end
  end

end
