require_relative 'questionsdatabase'
require_relative 'modelbase'

class Follow < ModelBase

  def self.most_followed_questions(n)
    most_follow = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_id
      GROUP BY
        questions.id, questions.body, questions.title, questions.user_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL
    most_follow.map{ |q| Question.new(q) }

  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL

    raise "No followers" if followers.empty?
    followers.map{|user| User.new(user)}
  end

  def self.followed_questions_for_user_id(user_id)
    followed = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON question_id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL

    raise "No questions followed" if followed.empty?
    followed.map{ |question| Question.new(question) }
  end

  attr_accessor :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
