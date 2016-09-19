require_relative 'questionsdatabase'
require_relative 'modelbase'

class Like < ModelBase

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL

    raise "No likers for that question" if likers.empty?
    likers.map{|user| User.new(user)}
  end

  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        count(*) AS num_likes
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    likes.first['num_likes']
  end

  def self.liked_questions_for_user_id(user_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL

    likes.map{ |q| Question.new(q) }
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        questions.id, questions.title, questions.body, questions.user_id
      ORDER BY
        COUNT(*)
      LIMIT
        ?
    SQL
    questions.map { |q| Question.new(q) }
  end

  attr_accessor :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
