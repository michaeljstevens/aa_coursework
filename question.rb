require_relative 'questionsdatabase'

class Question
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

  def author
    raise "#{self} not in database" unless @id
    User.find_by_id(@user_id)
  end

  def replies
    raise "#{self} not in database" unless @id
    Reply.find_by_question_id(@id)
  end
end
