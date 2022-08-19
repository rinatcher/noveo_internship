require_relative 'pagination_helper'
require_relative 'LinkedList'

helper = PaginationHelper.new(%w[a b c d e f], 4)
p helper.page_count # 2
p helper.item_count # 6
p helper.page_item_count(0) # 4, т.к нумерация страниц с 0
p helper.page_item_count(1) # 2, последняя страница содержит 2 элемента
p helper.page_item_count(2) # -1
# page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится
p helper.page_index(5) # 1
p helper.page_index(2) # 0
p helper.page_index(-1) # -1
p helper.page_index(-10) # -1

list = LinkedList.new

list.append(3)
list.append(5)
list.append(10)
p list.to_s #=> (3, 5, 10)

list.append_after(3, 15)
p list.to_s #=> (3, 15, 5, 10)
list.append_after(10, 25)
p list.to_s #=> (3, 15, 5, 10, 25)

list.delete(10)
p list.to_s #=> (3, 15, 5, 25)
p list.find(25) #=> Объект Node
p list.find(-1) #=> nil
