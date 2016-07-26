require_relative 'questionsdatabase'
require_relative 'modelbase'

class Reply < ModelBase

  attr_accessor :id, :parent_id, :user_id, :question_id, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.find_by_user_id(user_id)
    user_replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    raise "#{user_id} has no replies" if user_replies.length == 0
    user_replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    question_replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    raise "#{question_id} has no replies" if question_replies.length == 0
    question_replies.map { |reply| Reply.new(reply) }
  end

  def author
    raise "#{self} not in database" unless @id
    User.find_by_id(@user_id)
  end

  def question
    raise "#{self} not in database" unless @id
    Question.find_by_id(@question_id)
  end

  def parent_reply
    raise "#{self} not in database" unless @id
    raise "No parent" unless @parent_id
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    children = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL

    raise "No child replies" unless children.length > 0
    children.map{|child| Reply.new(child)}
  end


end
