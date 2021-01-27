require 'sqlite3'
require 'singleton'

# * require './plays.rb' in pry for setup

# Pulled Database into file and we only want one instance of this SINGLETON
class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

#   Calls all instances of data Play.all
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
        SELECT
            * 
        FROM
            plays
        WHERE
            title = ?
    SQL
    return nil unless play.length > 0

    Play.new(play.first) 

  end

#   Create instance of PLAY
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

#   Adds newly created instance into our array PlayDB database
  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

#   Changing the instance of i.e, salesman does not update the information on the table
#  You must change then call update on the variable to return a [] that certifies the change call Play.all to verify
  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end
