require_relative 'questionsdatabase'
require 'byebug'

class ModelBase

  TABLE_HASH = {
    "User" => "users"
    "Question" => "questions"
    "Like" => "question_likes"
    "Reply" => "replies"
    "Follow" => "question_follows"
  }

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(self.build_find_id_string, id)
    return nil unless user.length > 0
    self.new(user.first)
  end

  def self.build_find_id_string
    <<-SQL
      SELECT
        *
      FROM
        #{TABLE_HASH[self.name]}
      WHERE
        id = ?
    SQL
  end

  def self.all
  end

end
