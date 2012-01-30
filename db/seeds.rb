# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
if Guest.count < 2 then
  Guest.delete_all
  Session.delete_all
  Presentation.delete_all

  t = Time.now

  guests = Guest.create([{
    :last_name => 'Gundotra',
    :first_name => 'Vic',
    :title => 'Corporate Vice President, Microsoft Corporation|Chairman, Microsoft Asia-Pacific R&D Group'
  }, {
    :last_name => 'Barra',
    :first_name => 'Hugo',
    :title => 'Corporate Vice President, Microsoft Corporation|Chairman, Microsoft Asia-Pacific R&D Group'
  }])
  presentations = Presentation.create([{
    :title => %{I'm an Android},
    :datatype => 'keynote',
    :content => %{Thanks to the ecosystem of manufacturers, developers and carriers, the platform has grown exponentially--100M activated Android devices. Read more on the official blog post at http://goo.gl/XZkAo},
    :date => t.strftime("%Y-%m-%d"),
    :time => t
  }, {
    :title => %{I'm an iPhone},
    :datatype => 'panel',
    :content => %{Thanks to the ecosystem of manufacturers, developers and carriers, the platform has grown exponentially--100M activated Android devices. Read more on the official blog post at http://goo.gl/XZkAo},
    :date => t.strftime("%Y-%m-%d"),
    :time => t
  }])
  
  presentations.collect { |k| k.guests = guests }
end

if User.count < 1 then
  User.delete_all

  User.create(
    :email => 'a@example.com',
    :email_confirmation => 'a@example.com',
    :password => '1234',
    :password_confirmation => '1234',
    :last_name => 'Ex',
    :first_name => 'A'
  )
end
