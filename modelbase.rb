require_relative 'questionsdatabase'
require 'byebug'

class ModelBase

  TABLE_HASH = {
    "User" => "users",
    "Question" => "questions",
    "Like" => "question_likes",
    "Reply" => "replies",
    "Follow" => "question_follows"
  }

  def self.find_by_id(id)
    item = QuestionsDatabase.instance.execute(self.build_find_id_string, id)
    return nil unless item.length > 0
    self.new(item.first)
  end

  def self.all
    all_items = QuestionsDatabase.instance.execute(self.build_all_string)
    all_items.map{|item| self.new(item)}
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

  def self.build_all_string
    <<-SQL
      SELECT
        *
      FROM
        #{TABLE_HASH[self.name]}
    SQL
  end

  def build_create_string
    columns = self.instance_variables.map{|var| var.to_s[1..-1]}.drop(1)
    question_marks = columns.map{|el| "?"}.join(", ")

    <<-SQL
    INSERT INTO
      #{TABLE_HASH[self.class.name]}(#{columns.join(", ")})
    VALUES
      (#{question_marks})
    SQL
  end

  def save
    if @id
      update
    else
      create
    end
  end

  def create
    i_vars = self.instance_variables[1..-1].map{ |var| self.instance_variable_get(var) }
    QuestionsDatabase.instance.execute(build_create_string, *i_vars)
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    i_vars = self.instance_variables.map{ |var| self.instance_variable_get(var) }
    i_vars.rotate!
    QuestionsDatabase.instance.execute(build_update_string, *i_vars)
  end

  def build_update_string
    columns = self.instance_variables.map{|var| var.to_s[1..-1]}

    set_string = columns.drop(1).join(' = ?,')
    set_string << " = ?"

    <<-SQL
    UPDATE
      #{TABLE_HASH[self.class.name]}
    SET
      #{set_string}
    WHERE
      id = ?
  SQL
  end


end
