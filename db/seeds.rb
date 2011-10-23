# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

@user = User.create(:name => 'dreinavarro', :provider => 'twitter', :role => 'User', :uid => '13419462')
@user2 = User.create(:name => 'Alec Guintu', :provider => 'twitter', :role => 'User', :uid => '395766050')

@c1 = Category.create(:name => 'Music', :image => 'music.jpg')
Template.create(:category => @c1, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user)
@c2 = Category.create(:name => 'Comics', :image => 'comics.jpg')
Template.create(:category => @c2, :global_fields => "artist, release_date, publisher, issue_number, writer, character", :user_fields => "condition, variant", :user => @user)
@c3 = Category.create(:name => 'Cars', :image => 'cars.jpg')
Template.create(:category => @c3, :global_fields => "make, model, year, color,  engine_displacement", :user_fields => "mintness, bought_from", :user => @user)
@c4 = Category.create(:name => 'Action Figures', :image => 'action_figures.jpg')
Template.create(:category => @c4, :global_fields => "character, universe, height, points_of_articulation", :user_fields => "condition, bought_from", :user => @user)
@c5 = Category.create(:name => 'Seashells', :image => 'seashells.jpg')
Template.create(:category => @c5, :global_fields => "scientific_name, diameter,", :user_fields => "found_in", :user => @user)
@c6 = Category.create(:name => 'Girls', :image => 'girls.jpg')
Template.create(:category => @c6, :global_fields => "name, number, vital_stats, age, status", :user_fields => "stars", :user => @user)
@c7 = Category.create(:name => 'Bottles', :image => 'bottles.jpg')
Template.create(:category => @c7, :global_fields => "diameter, height, color, material", :user_fields => "condition, found_in", :user => @user)
@c8 = Category.create(:name => 'Stamps', :image => 'stamps.jpg')
Template.create(:category => @c8, :global_fields => "cost, number, country, year", :user_fields => "condition", :user => @user)
@c9 = Category.create(:name => 'Wine', :image => 'wine.gif')
Template.create(:category => @c9, :global_fields => "year, winery, flavor, color", :user_fields => "status", :user => @user)
@c10 = Category.create(:name => 'Statues', :image => 'statues.gif')
Template.create(:category => @c10, :global_fields => "artist, color, material", :user_fields => "condition", :user => @user)
@c11 = Category.create(:name => 'Baseball Cards', :image => 'baseball_cards.jpg')
Template.create(:category => @c11, :global_fields => "series_number, player", :user_fields => "condition", :user => @user)
@c12 = Category.create(:name => 'Coke Memorabilla', :image => 'coke.jpg')
Template.create(:category => @c12, :global_fields => "type, color, part_number, manufacturer", :user_fields => "condition", :user => @user)

Template.create(:category => @c1, :global_fields => "artist, release_date", :user_fields => "bought_from", :user => @user2)


@box = Box.create(:user => @user, :category => @c2, :name => 'My Comics')
@box2 = Box.create(:user => @user, :category => @c1, :name => 'My Music Collection')
@box3 = Box.create(:user => @user, :category => @c6, :name => 'My Girl')

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
Item.create(
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

Item.create(
  :category_id => @c1.id,
  :title => 'So Long Astoria',
  :description => 'First appearance',
  :tags => 'awesome, blah',
  :artist => 'Ataris',
  :release_date => '1992',
  :bought_from => 'Universal Records'
)


UserItem.create(
 :box => @box,
 :category_id => @c2.id,
 :title => 'Batgirl',
 :description => 'Silent Running',
 :tags => 'batgirl, dc',
 :artist => 'Stan Lee',
 :release_date => '2001',
 :publisher => 'DC',
 :issue_number => '#1',
 :writer => 'Jim Lee',
 :character => 'Batgirl',
 :condition => 'Mint',
 :variant => 'First edition',
 :image => ' Batgirl1-a.jpg'
)

UserItem.create(
 :box => @box,
 :category_id => @c2.id,
 :title => 'Batgirl',
 :description => 'A Knight Alone',
 :tags => 'batgirl, dc',
 :artist => 'Stan Lee',
 :release_date => '2001',
 :publisher => 'DC',
 :issue_number => '#1',
 :writer => 'Jim Lee',
 :character => 'Batgirl',
 :condition => 'Mint',
 :variant => 'First edition',
 :image => ' Batgirl2-a.jpg'
)

UserItem.create(
 :box => @box,
 :category_id => @c2.id,
 :title => 'Batgirl',
 :description => 'Death Wish',
 :tags => 'batgirl, dc',
 :artist => 'Stan Lee',
 :release_date => '2003',
 :publisher => 'DC',
 :issue_number => '#1',
 :writer => 'Jim Lee',
 :character => 'Batgirl',
 :condition => 'Mint',
 :variant => 'First edition',
 :image => ' Batgirl3-a.jpg'
)

UserItem.create(
 :box => @box,
 :category_id => @c2.id,
 :title => 'Batgirl',
 :description => 'Fists of Fury',
 :tags => 'batgirl, dc',
 :artist => 'Stan Lee',
 :release_date => '2004',
 :publisher => 'DC',
 :issue_number => '#1',
 :writer => 'Jim Lee',
 :character => 'Batgirl',
 :condition => 'Mint',
 :variant => 'First edition',
 :image => ' Batgirl4-a.jpg'
)

UserItem.create(
 :box => @box,
 :category_id => @c2.id,
 :title => 'Batgirl',
 :description => 'Destruction\'s Daughter',
 :tags => 'batgirl, dc',
 :artist => 'Stan Lee',
 :release_date => '2006',
 :publisher => 'DC',
 :issue_number => '#1',
 :writer => 'Jim Lee',
 :character => 'Batgirl',
 :condition => 'Mint',
 :variant => 'First edition',
 :image => ' Batgirl6-a.jpg'
)

UserItem.create(
 :box => @box2,
 :category_id => @c1.id,
 :title => 'So Long Astoria',
 :description => 'First appearance',
 :tags => 'awesome, blah',
 :artist => 'Ataris',
 :release_date => '1992',
 :bought_from => 'Universal Records',
 :image => 'TheAtaris.jpg'
)

UserItem.create(
 :box => @box2,
 :category_id => @c1.id,
 :title => 'Led Zeppelin',
 :description => 'First album',
 :tags => 'awesome, rock',
 :artist => 'Led Zeppelin',
 :release_date => '1969',
 :bought_from => 'Unknown',
 :image => 'LedZeppelin-LedZeppelin-1969.jpg'
)

UserItem.create(
 :box => @box2,
 :category_id => @c1.id,
 :title => 'Led Zeppelin',
 :description => 'Third album',
 :tags => 'awesome, rock',
 :artist => 'Led Zeppelin',
 :release_date => '1970',
 :bought_from => 'Unknown',
 :image => 'LedZeppelin-LedZeppelinIII-1970.jpg'
)

UserItem.create(
 :box => @box2,
 :category_id => @c1.id,
 :title => '8701',
 :description => 'Second album, MY FAVORITE',
 :tags => 'awesome, rock',
 :artist => 'Usher',
 :release_date => '2001',
 :bought_from => 'Unknown',
 :image => 'Usher-8701-2001.jpg'
)

UserItem.create(
 :box => @box2,
 :category_id => @c1.id,
 :title => 'The Fame',
 :description => 'First Album',
 :tags => 'pop, dance',
 :artist => 'Lady Gaga',
 :release_date => '2008',
 :bought_from => 'Unknown',
 :image => 'LadyGaga-The_Fame-2008.jpg'
)

UserItem.create(
 :box => @box2,
 :category_id => @c1.id,
 :title => 'The Fame Monster',
 :description => 'Second Album',
 :tags => 'pop, dance',
 :artist => 'Lady Gaga',
 :release_date => '2009',
 :bought_from => 'Unknown',
 :image => 'LadyGaga-TheFameMonster-2009.jpg'
)

UserItem.create(
 :box => @box2,
 :category_id => @c1.id,
 :title => 'Born This Way',
 :description => 'Third Album',
 :tags => 'pop, dance',
 :artist => 'Lady Gaga',
 :release_date => '2011',
 :bought_from => 'Unknown',
 :image => 'LadyGaga-Born_This_Way-2011.jpg'
)

UserItem.create(
 :box => @box3,
 :category_id => @c6.id,
 :title => 'Kate Upton',
 :description => 'o.o',
 :tags => 'models, swimsuit',
 :name => 'Kate Upton',
 :number => '909-987-6743',
 :vital_stats => '36 24 32',
 :age => '19',
 :status => 'Single',
 :image => 'KateUpton.jpg'
)

UserItem.create(
 :box => @box3,
 :category_id => @c6.id,
 :title => 'Melanie Iglesias',
 :description => 'o.o',
 :tags => 'models, swimsuit',
 :name => 'Melanie Iglesias',
 :number => '909-987-4567',
 :vital_stats => '36 24 32',
 :age => 'unknown',
 :status => 'Single',
 :image => 'MelanieIglesias.jpg'
)

UserItem.create(
 :box => @box3,
 :category_id => @c6.id,
 :title => 'Alyssa Miller',
 :description => 'o.0',
 :tags => 'models, swimsuit',
 :name => ' Alyssa Miller ',
 :number => '909-987-4567',
 :vital_stats => '36 24 32',
 :age => 'unknown',
 :status => 'Single',
 :image => 'AlyssaMiller.jpg'
)