require "byebug"
class Response < ActiveRecord::Base
  belongs_to(
   :user,
   primary_key: :id,
   foreign_key: :user_id,
   class_name: "User"
  )

  belongs_to(
    :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: "AnswerChoice"
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  validates :answer_choice_id, :user_id, :presence => true
  validate :respondent_already_answered?, :author_cannot_respond?

  def sibling_responses
    parent_question = question
    parent_question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.each do |el|
      if el.user_id == self.user_id
        errors[:user_answered] <<  " this question already"
      end
    end
  end

  def author_cannot_respond?
    if self.question.poll.author_id == self.user_id
      errors[:author] << "cannot respond to own question"
    end
  end

end
