# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create mahasiswa
User.create(:email => "adhiguna.sabril@gmail.com", :name => "adhiguna utama sabril", :gender => "pria", :keyid => "111128355", :password => "tes123456",:user_type => "mahasiswa" )

# create dosen
User.create(:email => "artdvl91@gmail.com", :name => "burhanuddin dirgantara", :gender => "pria", :keyid => "111111111", :password => "tes123456", :user_type => "dosen" )
