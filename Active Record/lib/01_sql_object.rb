require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
      @columns ||= DBConnection.execute2(<<-SQL)
      SELECT * 
      FROM "#{self.table_name}"
      LIMIT 0
      SQL
      @columns[0].map! do |col|
        col.to_sym
      end
  end


  def initialize
    @table_name = self.table_name
  end

  def self.finalize!
  end


  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end


  def self.table_name
    # ...
    "#{self}s".downcase
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
    
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
