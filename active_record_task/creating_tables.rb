require 'active_record'
require_relative 'tables'
require_relative 'migrations'

User.destroy_all
user1 = User.create(username: 'Rinatcher')
user2 = User.create(username: 'John')

Newspaper.destroy_all
Newspaper.create!(name: 'newspaper1', newspaper_type: 0)
Newspaper.create!(name: 'newspaper2', newspaper_type: 1)

Podcast.destroy_all
Podcast.create!(name: 'podcast1', podcast_type: 1)
Podcast.create!(name: 'podcast2', podcast_type: 2)

sub1 = Subscription.create(subscribable: Newspaper.second, user: user1)
sub2 = Subscription.create(subscribable: Podcast.first, user: user2)
sub1.disabled!
user = User.create(username: 'test')
Subscription.create!(subscribable: Podcast.second, user: user)
user.update(username:  "test2")
user.update(active: false)
