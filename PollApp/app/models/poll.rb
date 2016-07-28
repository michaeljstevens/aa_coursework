class Poll < ActiveRecord::Base

  belongs_to(
    :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
  )

  has_many(
    :questions,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: "Question"
  )

  validates :title, :author_id, :presence => true
  validates :title, :uniqueness => true

end
