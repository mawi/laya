# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



5.times do |t|
  User.create(:email => "user#{t}@example.com", :password => "123456", :password_confirmation => "123456", :approved => true)
end

3.times do |t|
  p = Plugin.create(:name => "Plugin #{t}", :description => "Plugin #{t} description")
  5.times do |i|
    Keyword.create(:keyword => "key#{t}#{i}", :trigger => "trigger#{t}#{i}", :plugin_id => p.id)
  end
end

10.times do |t|
  p = Project.create(:name => "Project #{t}")
  p.plugins << Plugin.all.sample
end


5.times do |t|
 Client.create(:name => "Client#{t}", :user_id => User.all.sample.id, :project_id => Project.all.sample.id)
end


