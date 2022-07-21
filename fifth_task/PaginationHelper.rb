class PaginationHelper
  def initialize(arr,page)
    @arr = arr
    @page = page
  end

  def page_count
    paginate(@page).length
  end

  def item_count
    @arr.length
  end

  def page_item_count(index)
    begin
    paginate(@page)[index].length
    rescue Exception
      -1
    end
  end

  def page_index(index)
    return -1 if index >= @arr.length || index < 0
    index / @page
  end

  private
  def paginate(page)
    @arr.each_slice(page).to_a
  end
end
