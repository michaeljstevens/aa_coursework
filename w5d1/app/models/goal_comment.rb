# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  goal_id    :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoalComment < ActiveRecord::Base
  validates :goal, :author, :body, presence: true

  belongs_to :goal

  # belongs_to :user,
  #   through: :goal,
  #   source: :user

  belongs_to :author,
  class_name: "User"

end
