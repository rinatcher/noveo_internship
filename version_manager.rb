class VersionManager

  def initialize(version = "0.0.1")
    @major = version[0].to_i
    @minor = version[2].to_i
    @patch = version[4].to_i
    @version = version.slice(0..4)
    @updates = []
    match_data = @version.match(/\d\.\d\.\d$/) || @version.match(/\d\.\d$/) || @version.match(/\d$/)
    raise 'Invalid version' if match_data.nil?
  end
  def major!
    @updates.append("#{@major}.#{@minor}.#{@patch}")
    @major += 1
    @minor = 0
    @patch = 0
    @version = "#{@major}.#{@minor}.#{@patch}"
  end
  def minor!
    @updates.append("#{@major}.#{@minor}.#{@patch}")
    @minor += 1
    @patch = 0
    @version = "#{@major}.#{@minor}.#{@patch}"
  end
  def patch!
    @updates.append("#{@major}.#{@minor}.#{@patch}")
    @patch += 1
    @version = "#{@major}.#{@minor}.#{@patch}"
  end
  def rollback!
    raise 'Can not rollback to previous version' if @updates.empty?
    @major = @updates.last[0].to_i
    @minor = @updates.last[2].to_i
    @patch = @updates.last[4].to_i
    @updates.pop
  end
  def release
    "#{@major}.#{@minor}.#{@patch}"
  end
end

# Нужно реализовать класс VersionManager. Конструктор опционально должен принимать строку - версию.
# Допустимые варианты строки: “{major}” (“1”), “{major}.{minor}” (“1.1”), “{major}.{minor}.{patch}” (“1.1.1”).
# В варианте типа "1.1.1.1.1" оставить только первые три значения версии.
# Если часть версии - не целое число (напр. "а.4.е"), то генерировать ошибку.
# Если версия не указана, то значение по умолчанию - “0.0.1”.

vm = VersionManager.new("1.2.3")
vm.minor!
p vm.release
vm.major!
p vm.release
vm.rollback!
p vm.release
vm.patch!
p vm.release
