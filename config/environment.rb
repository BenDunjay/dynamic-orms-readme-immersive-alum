require "sqlite3"
require "byebug"

DB = { :conn => SQLite3::Database.new("db/songs.db") } # create database
DB[:conn].execute("DROP TABLE IF EXISTS songs") # drop songs to avoid an error

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

DB[:conn].execute(sql) #creates tables
DB[:conn].results_as_hash = true #allows you to return hashed data instead of array.

# instead of [1, "Ben", 20] you will get {id => 1, name => "Ben", age => 20}
