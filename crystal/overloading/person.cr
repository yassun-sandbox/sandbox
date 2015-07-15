class Person
  getter age

  def initialize
    @age = 0
  end

  def become_older
    @age += 1
  end

  def become_older(years : Int32)
    @age += years
  end

  def become_older(years : String)
    @age += years.to_i
  end

  def become_older
    @age += yield @age
  end
end

person = Person.new

person.become_older
puts person.age #=> 1

person.become_older 5
puts person.age #=> 6

person.become_older "12"
puts person.age #=> 18

person.become_older do |current_age|
  current_age < 20 ? 10 : 30
end
puts person.age #=> 28

