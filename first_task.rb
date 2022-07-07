def sum(arr)
  return 0 if arr.empty?
  arr.pop + sum(arr)
end

puts sum([-1,2.7,3,4,5])
