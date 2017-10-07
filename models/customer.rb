require_relative '../db/sql_runner'

class Customer

  attr_accessor

  def initialize(customer_hash)
    @id = customer_hash['id'].to_i if customer_hash['id']
    @name = customer_hash['name']
    @funds = customer_hash['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES
    (
      $1, $2
    )
    returning id;
    "
    values = [@name, @funds]
    result = SqlRunner.run(sql, "save_customer", values)
    @id = result.first['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (
    name,
    funds
    ) = (
      '#{@name}',
      '#{@funds}'
    )
    WHERE id = #{id};"
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, 'all', values)
    return customers.map {|customer_hash| Customer.new(customer_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1;"
    values = [id]
    customer_hash = SqlRunner.run(sql, 'find', values).first()
    customer = Customer.new(customer_hash)
    return customer
  end
end
