class Person
  attr_reader :name, :friends

  def initialize(name)
    @name = name
    @friends = FriendRelation.new(self)
  end

  def friend_with?(person)
    friends.array.include?(person)
  end
end

class FriendRelation
  attr_reader :array, :owner

  def initialize(owner)
    @owner = owner
    @array = []
  end

  def <<(person)
    array.push(person)
    person.friends.array.push(owner)
  end
end

class Array
  def push(other)
    return if include? other
    self << other
  end
end
