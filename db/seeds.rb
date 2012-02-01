# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
if Guest.count < 1 then
  Guest.delete_all
  Session.delete_all
  Presentation.delete_all

  lam = Guest.create(
    :last_name => 'Lam',
    :first_name => 'Khee Poh',
    :title => 'PhD, Royal Institute of British Architects|Board of Directors of Energy Foundation, USA; US-China Green Energy Council|Professor in School of Architecture, Carnegie Mellon University'
  )
  panel1 = Presentation.create(
    :title => %{Energy and Environment Panel: Towards a Sustainable Future},
    :datatype => 'panel',
    :content => %{Energy and environment problem, especially the global climate change has become a major concern for our planet. As the two largest economies in the world, the United States and China have the responsibility and opportunity to work hand-in-hand solving the problem and building a sustainable future for our children. Carnegie Mellon has world leading researchers in this sphere. Together with policy makers, entrepreneurs, environmentalists and anyone who are interested in solving this problem, we are ready to proceed. Topics include energy generation and efficiency solutions, energy and environment policies and green buildings and cities.},
    :date => '2012-01-01',
    :time => '00:00'
  )
  
  panel1.guests << lam
end

if User.count < 1 then
  User.delete_all

  User.create(
    :email => 'info@cmusummit.org',
    :email_confirmation => 'info@cmusummit.org',
    :password => 'pkusms',
    :password_confirmation => 'pkusms',
    :last_name => 'Doe',
    :first_name => 'John',
    :is_admin => true
  )
end
