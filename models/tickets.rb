require_relative("../db/sql_runner")
require_relative("customer")
require_relative("films")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :location_id, :tickets

  def initialize(tickets_hash)
    @id = tickets_hash['id'].to_i
    @customer_id = tickets_hash['customer_id'].to_i
    @ticket_id = options['ticket_id'].to_i

  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      ticket_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @ticket_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end


  def Ticket.all()
    sql = "SELECT * FROM tickets"
    values = []
    visit_data = SqlRunner.run(sql, values)
    return Ticket.map_items(ticket_data)
  end

  def Ticket.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def customer()
    sql = "SELECT * FROM users WHERE id = $1"
    values = [@customer_id]
    user = SqlRunner.run(sql, values).first
    return Customer.new(customer)
end

  def films()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    user = SqlRunner.run(sql, values).first
    return Film.new(film)
  end

  def ticket()
    sql = "SELECT * FROM tickets
    WHERE id = $1"
    values = [@ticket_id]
    ticket = SqlRunner.run(sql, values).first
    return Ticket.new(location)
  end

  def Ticket.map_items(tickets_hash)
    result = tickets_hash.map {|ticket| Ticket.new(ticket)}
    return result
  end 

end
