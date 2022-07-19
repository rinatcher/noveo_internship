# Нужно реализовать класс HashWithIndifferentAccess, который позволит обращаться к ключу-строке по символу и наоборот.
# Для это следует расширить существующий класс Hash. Также добавить метод для перехода от обычного хеша к модифицированному.

# Тестовые варианты

# h = { a: 'apple' }.with_indifferent_access
# puts h['a'] # => apple
# hash[:foo] = 'bar'
# puts hash['foo']  # => bar


class HashWithIndifferentAccess < Hash
  def initialize(h)
    h.each { |k, v| self[key_to_s(k)] = v }
  end

  def [](key)
    super(key_to_s(key))
  end

  def []=(key, val)
    self.store(key_to_s(key), val)
  end

  private
  def key_to_s(key)
    key.is_a?(Symbol) ? key.to_s : key
  end
end

class Hash
  def with_indifferent_access
    #: return HashWithIndifferentAccess
    HashWithIndifferentAccess.new(self)
  end
end

hash = { "a": 'apple' }.with_indifferent_access
hash[:foo] = 'bar'

p hash[:a] # => apple
p hash['foo']  # => bar
p hash
