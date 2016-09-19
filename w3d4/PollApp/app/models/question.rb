require 'byebug'
class Question < ActiveRecord::Base

  belongs_to(
    :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: "Poll"
  )

  has_many(
    :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: "AnswerChoice"
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  validates :text, :poll_id, :presence => true

  def results
    answers = AnswerChoice.find_by_sql(<<-SQL)
      SELECT
        answer_choices.*, COUNT(responses.*) as num_responses
      FROM
        answer_choices
      JOIN
        responses ON answer_choices.id = responses.answer_choice_id
      WHERE
        responses.answer_choice_id = answer_choices.id
      GROUP BY
        answer_choices.question_id, answer_choices.id
      SQL
    results_hash = {}
    answers.each do |answer_choice|
      results_hash[answer_choice] = answer_choice.num_responses
    end
    results_hash
  end


end
