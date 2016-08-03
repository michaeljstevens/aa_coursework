
class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(PENDING APPROVED DENIED)

  validates :status, inclusion: { in: STATUSES }
  validate :overlapping_requests


  belongs_to :cat


  def overlapping_requests
    @requests = CatRentalRequest.all
    @requests.each do |request|
      unless self == request
        if self.start_date < request.end_date && self.end_date > request.start_date
          if request.overlapping_approved_requests
            self.errors[:overlap] << "Request overlaps with another approved request"
          end
        end
      end
    end
  end

  def overlapping_approved_requests
    return true if self.status == "APPROVED"
    false
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.overlapping_pending_requests
      self.save
    end
  end

  def overlapping_pending_requests
    @requests = CatRentalRequest.where(cat_id: self.cat_id)
    @requests.each do |request|
      unless self == request
        if request.start_date < self.end_date && request.end_date > self.start_date
          request.status = "DENIED"
          request.save
        end
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save
  end

end
