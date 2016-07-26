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

  def self.where(options)
    query = self.build_where_string(options)
    item = QuestionsDatabase.instance.execute(query)

    return nil if item.empty?
    item.map { |i| self.new(i) }
  end

  def self.build_where_string(options)
    where_vals = options.map{|k,v| "#{k} = \"#{v}\""}
    where_string = where_vals.join(" AND ")

    <<-SQL
    SELECT
      *
    FROM
      #{TABLE_HASH[self.name]}
    WHERE
      #{where_string}
  SQL

  end

  def self.method_missing(method_name, *args)
    method_name = method_name.to_s
    options = {}
    if method_name.start_with?("find_by_")
      attributes = method_name[("find_by_".length)..-1].split("_and_")

      unless attributes.length == args.length
        raise "unexpected # of arguments"
      end

      attributes.each_with_index { |el, idx| options[el] = args[idx] }
      return self.where(options)
    else
      super(method_name.to_sym)
    end
  end
end
