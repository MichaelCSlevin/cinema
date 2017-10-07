require_relative '../db/sql_runner'

class Film

  attr_accessor

  def initialize (film_hash)
    @id = film_hash['id'].to_i if film_hash['id']
    @title = film_hash['title']
    @price = film_hash['price']
  end

  def save()
    sql = "INSERT INTO films (title, price)
    VALUES
    (
      $1, $2
    )
    returning id;
    "
    values = [@title, @price]
    result = SqlRunner.run(sql, "save_film", values)
    @id = result.first['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    sqlRunner.run(sql, values)
  end


  def update()
    sql = "UPDATE films SET (
    title,
    price
    ) = (
      '#{@title}',
      '#{@price}'
    )
    WHERE id = #{id};"
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, 'all', values)
    return films.map {|film_hash| Film.new(film_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = $1;"
    values = [id]
    film_hash = SqlRunner.run(sql, 'find', values).first()
    film = Film.new(film_hash)
    return film
  end

end
