class PaginationHelper
  def initialize(arr,page)
    @arr = arr
    @page = page
  end

  def page_count
    return @arr.length / @page + 1 if @arr.length % @page != 0
    @arr.length / @page
  end

  def item_count
    @arr.length
  end

  def page_item_count(index)
    if @arr.length % @page == 0
      return @page
    end
    case index
    when 0...page_count - 1
      return @page
    when page_count - 1
      return @arr.length % @page
    else
      -1
    end
  end

  def page_index(index)
    return -1 if index >= @arr.length || index < 0
    index / @page
  end
end
