require_relative 'questionsdatabase'
require_relative 'modelbase'

class Question < ModelBase
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    return nil unless question.length > 0
    Question.new(question.first)
  end

  def self.most_followed(n)
    Follow.most_followed_questions(n)
  end

  attr_accessor :title, :body, :id, :user_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def self.find_by_author(author_id)
    author = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    raise "#{author} has no questions" if author.length == 0
    author.map { |q| Question.new(q) }
  end

  def self.most_liked(n)
    Like.most_liked_questions(n)
  end

  def author
    raise "#{self} not in database" unless @id
    User.find_by_id(@user_id)
  end

  def replies
    raise "#{self} not in database" unless @id
    Reply.find_by_question_id(@id)
  end

  def followers
    Follow.followers_for_question_id(@id)
  end

  def likers
    Like.likers_for_question_id(@id)
  end

  def num_likes
    Like.num_likes_for_question_id(@id)
  end

  def save
    if @id
      update
    else
      create
    end
  end

  def create
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions(title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, user_id = ?
      WHERE
        id = ?
    SQL
  end
end
