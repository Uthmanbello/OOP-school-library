class Person
  def initialize(age, name = "Unknown", parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def id 
    @id
  end

  def name 
    @name
  end

  def age
    @age
  end

  def name=(value)
    @name = value
  end

  def age=(value)
    @age = value
  end

  def can_use_services?
    return (is_of_age? || parent_permission) ? true : false
  end

  private

  def is_of_age?
    return @age >= 18 ? true : false
  end
end