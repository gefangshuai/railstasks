# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Project.delete_all
User.delete_all

users = User.create([{ 
    username: 'admin',
    password: '123456', 
    password_confirmation: '123456',
    email: 'gefangshuai@163.com'
  },{
    username: 'yuanbingbing',
    email: 'yuanbingbing@163.com',
    password: '123456',
    password_confirmation: '123456'
  }])
Task.create(title: '测试', content: '测试任务内容而已', user: users.first)
12.times do |i|
    Project.create(name: "项目#{i}", description: "项目#{i}的内容")
end
