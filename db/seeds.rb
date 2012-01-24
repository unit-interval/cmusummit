# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
if Speaker.count < 2 then
  Speaker.delete_all
  Session.delete_all
  Keynote.delete_all
  
  speakers = Speaker.create([{
    :last_name => 'Gundotra',
    :first_name => 'Vic',
    :title => 'Corporate Vice President, Microsoft Corporation|Chairman, Microsoft Asia-Pacific R&D Group'
  }, {
    :last_name => 'Barra',
    :first_name => 'Hugo',
    :title => 'Corporate Vice President, Microsoft Corporation|Chairman, Microsoft Asia-Pacific R&D Group'
  }])
  keynotes = Keynote.create([{
    :title => %{Thanks to the ecosystem of manufacturers, developers and carriers, the platform has grown exponentially--100M activated Android devices. Read more on the official blog post at http://goo.gl/XZkAo}
  }, {
    :title => %{Thanks to the ecosystem of manufacturers, developers and carriers, the platform has grown exponentially--100M activated Android devices. Read more on the official blog post at http://goo.gl/XZkAo}
  }])
  
  keynotes.collect { |k| k.speakers = speakers }
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
