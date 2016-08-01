# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  email      :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  validates :user_id, :presence => true, :uniqueness => { :scope => :email }
  validates :email, :name, :presence => true

  belongs_to :user

  has_many :contact_shares, :dependent => :destroy

  has_many :shared_users,
    through: :contact_shares,
    source: :user
end
