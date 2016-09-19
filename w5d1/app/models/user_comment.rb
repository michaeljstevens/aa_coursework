# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserComment < ActiveRecord::Base
  validates :body, :user, :author, presence: true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: "User"
  
  belongs_to :user

end
