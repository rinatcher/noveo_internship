# Нужно реализовать класс HashWithIndifferentAccess, который позволит обращаться к ключу-строке по символу и наоборот.
# Для это следует расширить существующий класс Hash. Также добавить метод для перехода от обычного хеша к модифицированному.

# Тестовые варианты

# h = { a: 'apple' }.with_indifferent_access
# puts h['a'] # => apple
# hash[:foo] = 'bar'
# puts hash['foo']  # => bar


class HashWithIndifferentAccess < Hash
  def [](key)
    return super(key) if include?(key)
    case key
    when Symbol then return super(key.to_s) if include?(key.to_s)
    when String then return super(key.to_sym) if include?(key.to_sym)
    end
  end
end
class Hash
  def with_indifferent_access
    #: return HashWithIndifferentAccess
    HashWithIndifferentAccess[self]
  end
end

hash = { "a": 'apple' }.with_indifferent_access
hash[:foo] = 'bar'

p hash[:a] # => apple
p hash['foo']  # => bar
p hash[:foo]
p hash
