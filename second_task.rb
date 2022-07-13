# Первая задача (побитовое или)
def bitwise_or(n)
  res = 0
  (0..n).each { |i| res = res | i }
  res
end
puts bitwise_or(4)

# Вторая задача
def clear_str(str)
  (0..str.length).each {str.sub!(/\w#/) { "" }}
  str.gsub!("#","")
  str
end

puts clear_str "a#bc#d"
puts clear_str "abc##d######"
puts clear_str "abc#d##c"
puts clear_str ""
puts clear_str "#######"