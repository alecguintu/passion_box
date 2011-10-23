# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# puts 'EMPTY THE MONGODB DATABASE'
# Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

@user = User.create(:name => 'dreinavarro', :provider => 'twitter', :role => 'User', :uid => '13419462')
@user2 = User.create(:name => 'Alec Guintu', :provider => 'twitter', :role => 'User', :uid => '395766050')

@c1 = Category.create(:name => 'Music', :image => 'music.jpg')
Template.create(:category => @c1, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c2 = Category.create(:name => 'Comics', :image => 'comics.jpg')
Template.create(:category => @c2, :global_fields => "artist, release_date, publisher, issue_number, writer, character", :user_fields => "condition, variant", :user => @user)
@c3 = Category.create(:name => 'Cars', :image => 'cars.jpg')
Template.create(:category => @c3, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c4 = Category.create(:name => 'Action Figures', :image => 'action_figures.jpg')
Template.create(:category => @c4, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c5 = Category.create(:name => 'Seashells', :image => 'seashells.jpg')
Template.create(:category => @c5, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c6 = Category.create(:name => 'Girls', :image => 'girls.jpg')
Template.create(:category => @c6, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c7 = Category.create(:name => 'Bottles', :image => 'bottles.jpg')
Template.create(:category => @c7, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c8 = Category.create(:name => 'Stamps', :image => 'stamps.jpg')
Template.create(:category => @c8, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c9 = Category.create(:name => 'Wine', :image => 'wine.gif')
Template.create(:category => @c9, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c10 = Category.create(:name => 'Statues', :image => 'statues.gif')
Template.create(:category => @c10, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c11 = Category.create(:name => 'Baseball Cards', :image => 'baseball_cards.jpg')
Template.create(:category => @c11, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c12 = Category.create(:name => 'Coke Memorabilla', :image => 'coke.jpg')
Template.create(:category => @c12, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)

Template.create(:category => @c1, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user2)


@box = Box.create(:user => @user, :category => @c2, :name => 'My Comics')
@box2 = Box.create(:user => @user2, :category => @c1, :name => 'My Music Collection')


UserItem.create(
  :box => @box,
  :category_id => @c2.id,
  :title => 'Detective Comics #1',
  :description => 'First appearance',
  :tags => 'batman, dc',
  :artist => 'Stan Lee',
  :release_date => '1937',
  :publisher => 'Action Comics',
  :issue_number => '#1',
  :writer => 'Jim Lee',
  :character => 'Batman',
  :condition => 'Mint',
  :variant => 'First edition',
  :image => 'Detective_Comics_1.jpg'
)

UserItem.create(
  :box => @box2,
  :category_id => @c1.id,
  :title => 'So Long Astoria',
  :description => 'First appearance',
  :tags => 'awesome, blah',
  :artist => 'Ataris',
  :release_date => '1992',
  :bought_from => 'Universal Records'
)