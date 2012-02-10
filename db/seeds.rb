# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
if Guest.count < 4 then
  Guest.delete_all
  Session.delete_all
  Presentation.delete_all

  lam = Guest.create(
    :last_name => 'Lam',
    :first_name => 'Khee Poh',
    :datatype => 'panel',
    :title => 'PhD, Royal Institute of British Architects|Board of Directors of Energy Foundation, USA|US-China Green Energy Council|Professor in School of Architecture, Carnegie Mellon University',
    :picture => 'panelist1.jpg'
  )
  anwar = Guest.create(
    :last_name => 'Anwar',
    :first_name => 'Aamir',
    :datatype => 'advisor',
    :title => 'CMU International Alumni Relations Director',
    :picture => 'advisor1.jpg'
  )
  blum = Guest.create(
    :last_name => 'Blum',
    :first_name => 'Lenore',
    :datatype => 'advisor',
    :title => 'Computer Science Professor, Director Project Olympus',
    :picture => 'advisor2.jpg'
  )
  tu = Guest.create(
    :last_name => 'Tu',
    :first_name => 'Zipei',
    :datatype => 'advisor',
    :title => 'President of the Chinese Association for Science and Technology - Pittsburgh Chapter',
    :picture => 'advisor3.jpg'
  )
  panel1 = Presentation.create(
    :title => %{Energy and Environment Panel: Towards a Sustainable Future},
    :datatype => 'panel',
    :content => %{Energy and environment problem, especially the global climate change has become a major concern for our planet. As the two largest economies in the world, the United States and China have the responsibility and opportunity to work hand-in-hand solving the problem and building a sustainable future for our children. Carnegie Mellon has world leading researchers in this sphere. Together with policy makers, entrepreneurs, environmentalists and anyone who are interested in solving this problem, we are ready to proceed. Topics include energy generation and efficiency solutions, energy and environment policies and green buildings and cities.},
    :date => '2012-04-28',
    :time => '12:00'
  )
  panel1.guests << lam
  panel2 = Presentation.create(
    :title => %{IT Panel B: Social Networking Technologies},
    :datatype => 'panel',
    :content => %{In the new millennium, social networking techniques have permeated into a great variety of areas in industry, and have fundamentally changed the way we work and live. In recent years, social networking has developed beyond its traditional sense to the extent that any aspect of life that emphasizes users can potentially benefit from the social elements, such as entertainment, health care, etc. In this panel, we would like to present you the popular ideas and trends of the social networking arena.Topics include Social Networks, Microblogging Services, Mobile Applications, Socially-enhanced Health Care and Social Entertainment},
    :date => '2012-04-28',
    :time => '12:00'
  )
  panel3 = Presentation.create(
    :title => %{IT Panel A: Cloud Computing and Security},
    :datatype => 'panel',
    :content => %{Computing has become a major part of the fabric of modern society as about two billion people are on the Internet. In the new millennium, computer security has moved to the forefront of public concern. As the dynamic threat landscape continues to evolve over time, it remains high for online user to expect better security, privacy, and reliability in computing. Cloud computing  is the IT solution for the 21st century. As IT managers face new constraints on costs, space and power, a new class of solutions is emerging to transform the data center through cloud-based architectures. Cloud computing provides a new model which cuts through IT complexity by leveraging the efficient pooling of on-demand, self-managed virtual infrastructure, consumed as a service. Topics include Security (Trustworthy Computing Platforms & Devices, Next-Generation Secure & Available Networks, Mobile Security) and Cloud Computing (IT outsourcing, Web services, Huge data analytics, Mobile handhelds, Visual computing)},
    :date => '2012-04-28',
    :time => '12:00'
  )
  panel4 = Presentation.create(
    :title => %{Innovation and Entrepreneurship Panel: Cooperation Opportunities in Supporting Innovation and Entrepreneurship},
    :datatype => 'panel',
    :content => %{In the next 40 years, the population of China will increase by 100 million. During the same period, the population over the world also has a rapid raise. Therefore, more jobs need to be created. Innovation and Entrepreneurship is important for current business and people who have business ideas. With Innovation and Entrepreneurship, people can build a foundation that supports their dream. I & E can also drive the development of society. Topics include Innovation and entrepreneurship environment in China, US and China entrepreneur experience sharing, The Perks & Challenges of Starting a Business in China, US and China's policy on supporting innovation and entrepreneurship, Cooperation opportunities on innovation and entrepreneurship between CMU, US, and China.},
    :date => '2012-04-28',
    :time => '12:00'
  )
  panel5 = Presentation.create(
    :title => %{Finance Panel: Capital Investment Opportunities in Post-Global Financial Crisis Era},
    :datatype => 'panel',
    :content => %{The last three years have weathered serious shrink of global financial market. Outputs in advanced economies and emerging markets have slumped. Reversal in capital flows, currency depreciation, and liquidity problems coupled with negative growth. In finance panel, we will explore initiatives to restore confidence and stability to the global capital market and the potential investment opportunities in innovation and entrepreneurship. Topics include capital market prospect in China, U.S. and worldwide, current investment market opportunities in China and US and possibility of establishing a new funding mechanism for innovative ideas and technology.},
    :date => '2012-04-28',
    :time => '12:00'
  )
  panel6 = Presentation.create(
    :title => %{Healthcare Panel: U.S. & China Healthcare Reform – Opportunities and Challenges},
    :datatype => 'panel',
    :content => %{China has been the targeted market for consumer goods and services for decades. With China’s demographics shift and healthcare reform in recent years, the health care market is becoming more and more attractive to US companies. Where will the healthcare reform head towards? What are the future business opportunities in healthcare industry in China? What are the challenging issues for US companies doing business in China? Topics include Healthcare Reform, Regulatory Issues, Pharmaceutical Industry, Healthcare IT Industry and Hospitals.},
    :date => '2012-04-28',
    :time => '12:00'
  )
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
