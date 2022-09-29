require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'postgres',
  password: 'postgres',
  database: 'postgres'
)

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

class User < ActiveRecord::Base
  has_many :subscriptions
  validates :username, presence: true, uniqueness: true

  def update(attributes)
    super
    Subscription.where("user_id = #{id}").update_all status: 1 unless active
  end
end

class Podcast < ActiveRecord::Base
  has_many :subscriptions, as: :subscribable
  enum podcast_type: [ :entartainment, :science, :health ]
  validates :name, presence: true, uniqueness: true
  validates :podcast_type, inclusion: { in: podcast_types.keys }
end

class Newspaper < ActiveRecord::Base
  has_many :subscriptions, as: :subscribable
  enum newspaper_type: [ :sports, :news, :weather ]
  validates :name, presence: true, uniqueness: true
  validates :newspaper_type, inclusion: { in: newspaper_types.keys }
end

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscribable, polymorphic: true
  enum status: %i[active disabled]
end
