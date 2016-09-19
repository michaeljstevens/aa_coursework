# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  details    :text             not null
#  user_id    :integer          not null
#  private    :boolean          default(FALSE)
#  completed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base

  validates :title, :details, :user, presence: true

  belongs_to :user

  has_many :goal_comments,
  primary_key: :id,
  foreign_key: :goal_id,
  class_name: "GoalComment"
end
