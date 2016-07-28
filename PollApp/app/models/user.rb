require 'byebug'
class User < ActiveRecord::Base

  has_many(
    :polls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Poll"
  )

  has_many(
    :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Response"
  )

  validates :user_name, :presence => true

  def completed_polls
    joined_tables = Poll.select(:id).joins(:questions).joins(:answer_choices).joins(<<-SQL, self.id)
    LEFT OUTER JOIN (
      SELECT
        *
      FROM
        responses
      WHERE
        responses.user_id = ?
    ) AS user_responses
      ON user_responses.answer_choice_id = answer_choices.id
    SQL
    joined_tables.group(:polls, :id).
    having("COUNT(DISTINCT questions.id) = COUNT(user_responses.id)")
  end
end
#
# SELECT polls.id
# FROM polls
# JOIN questions ON questions.poll_id = polls.id
# JOIN answer_choices ON answer_choices.question_id = questions.id
# LEFT OUTER JOIN (
#   SELECT *
#   FROM responses
#   WHERE responses.user_id = 1
# ) AS user_responses ON user_responses.answer_choice_id = answer_choices.id
# GROUP BY polls.id
# HAVING COUNT(DISTINCT questions.id) = COUNT(user_responses.id)
