require_relative 'questionsdatabase'

class User
  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    return nil unless user.length > 0
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    raise "#{fname} #{lname} does not exist" if name.empty?
    User.new(name.first)
  end

  attr_accessor :fname, :lname, :id

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    raise "#{self} doesn't exist" unless @id
    Question.find_by_author(@id)
  end

  def authored_replies
    raise "#{self} doesn't exist" unless @id
    Reply.find_by_user_id(@id)
  end
end
