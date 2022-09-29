require 'active_record'
require_relative 'tables'

class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |user|
      user.string :username, null: false, unique: true
      user.boolean :active, default: true, null: false
      user.timestamps
    end
  end
end

class CreateNewspapersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :newspapers do |table|
      table.string :name, null: false, unique: true
      table.integer :newspaper_type, null: false
      table.timestamps
    end
  end
end

class CreatePodcastsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |table|
      table.string :name, null: false, unique: true
      table.integer :podcast_type, null: false
      table.timestamps
    end
  end
end

class CreateSubscriptionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |table|
      table.references :subscribable, null: false, polymorphic: true
      table.references :user, foreign_key: true, null: false
      table.integer :status, default: 0, null: false
      table.timestamps
    end
  end
end
CreateSubscriptionTable.migrate(:down)
CreatePodcastsTable.migrate(:down)
CreateNewspapersTable.migrate(:down)
CreateUsersTable.migrate(:down)
CreateUsersTable.migrate(:up) unless ActiveRecord::Base.connection.table_exists?('users')
CreateNewspapersTable.migrate(:up) unless ActiveRecord::Base.connection.table_exists?('newspapers')
CreatePodcastsTable.migrate(:up) unless ActiveRecord::Base.connection.table_exists?('podcasts')
CreateSubscriptionTable.migrate(:up) unless ActiveRecord::Base.connection.table_exists?('subscriptions')
