class Cat < ActiveRecord::Base

  has_many :cat_rental_requests, dependent: :destroy

  COLORS = %w(brown white orange black grey calico)
  SEXES = %w(M F)
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: SEXES }


  def age
    Time.now.to_date - self.birth_date
  end


end
