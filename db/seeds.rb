# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create mahasiswa
User.create(:name => "adhiguna utama sabril", :keyid => "111128355", :password => "tes123456",:user_type => "mahasiswa" )
User.create(:name => "ana riana", :keyid => "111128376", :password => "tes123456",:user_type => "mahasiswa" )
User.create(:name => "Bambang Joko Widodo", :keyid => "111128383", :password => "tes123456",:user_type => "mahasiswa" )
User.create(:name => "Mita Mushliha", :keyid => "111128386", :password => "tes123456", :user_type => "mahasiswa" )
User.create(:name => "Rifky Sintami", :keyid => "111128365", :password => "tes123456",:user_type => "mahasiswa" )
User.create(:name => "Santy Fauziyah", :keyid => "111128370", :password => "tes123456",:user_type => "mahasiswa" )
User.create(:name => "Al Bukhari Pahlevi", :keyid => "111128369", :password => "tes123456",:user_type => "mahasiswa" )
User.create(:name => "Nira Pebriani", :keyid => "111128382", :password => "tes123456",:user_type => "mahasiswa" )

# create dosen
@dosen = User.create(:name => "Burhanuddin Dirgantara,Ir,MT.", :keyid => "93680086-1", :password => "tes123456", :user_type => "dosen", :limit_proposal => "5", :limit_scription => "5" )
@dosen2 = User.create(:name => "Efri Suhartono, ST., MT.", :keyid => "99730171-1", :password => "tes123456", :user_type => "dosen", :limit_proposal => "5", :limit_scription => "5" )
@dosen3 = User.create(:name => "Istikmal,ST,MT.", :keyid => "08790474-1", :password => "tes123456", :user_type => "dosen", :limit_proposal => "5", :limit_scription => "5" )
#status mahasiswa

status_mahasiswa = {
  1 => "belum ada judul",
  2 => "mengajukan judul",
  3 => "pengerjaan proposal"
}

(1..3).each do |i|
  UserStatus.create(:description => "#{status_mahasiswa[i]}")
end

# judul TA
titles = {
    1 => "Perancangan dan implementasi monitoring tugas akhir",
    2 => "perancangan quadcopter dengan menggunakan raspberry",
    3 => "augmented reality untuk jalan raya",
    4 => "perancangan web services untuk rumah sakit",
    5 => "pencarian lokasi terdekat dengan menggunakan algoritma djikstra",
    6 => "monitoring pada jalur kereta api",
    7 => "pencitraan menggunakan matlab",
    8 => "pembuatan aplikasi web dengan menggunakan node.js",
    9 => "aplikasi android untuk monitoring kesehatan",
    10 => "antena mikrostrip",
    11 => "collaborator application dengan ruby on rails web framework"
}

# meta tag TA
meta = {
    1 => "monitoring",
    2 => "quadcopter, raspberry",
    3 => "augmented reality",
    4 => "web services, rumah sakit",
    5 => "algoritma djikstra",
    6 => "monitoring, kereta api",
    7 => "pencitraan,matlab",
    8 => "aplikasi web,node.js",
    9 => "android,monitoring, kesehatan",
    10 => "antena, mikrostrip",
    11 => "collaborator application,ruby on rails, web framework"
}


# deskripsi TA
description = '<p><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14px; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; display: inline !important; float: none;">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
              </span></p>'

# bikin TA
(1..3).each do |i|
  Topic.create(:lecture_id => @dosen.id.to_i, :title => "#{titles[i]}", :description => "#{description}", :tag_list => "#{meta[i]}")
end

(4..8).each do |i|
  Topic.create(:lecture_id => @dosen2.id.to_i, :title => "#{titles[i]}", :description => "#{description}", :tag_list => "#{meta[i]}")
end

(9..11).each do |i|
  Topic.create(:lecture_id => @dosen3.id.to_i, :title => "#{titles[i]}", :description => "#{description}", :tag_list => "#{meta[i]}")
end

# proposal create
(2..6).each do |i|
  topic_select = Topic.find("#{i}")
  topic_select.update_attributes(:tag_id => "#{i}", :topic_status_id => "#{i%2 == 1 ? 3:2}", :confirmation => "#{i%2}")
  if "#{i%2 == 1 ? 'true' : 'false'}" == 'true'
    Proposal.create(:topic_id => "#{i}", :lecture_id => "#{topic_select.lecture_topic.id.to_i}", :student_id => "#{i}")
  end
end

# admin config
AdminConfig.create(:max_lecture_student_proposal => "5",:max_lecture_student_scription => "5")

# status name
status_name = {
  1 => "judul belum diambil",
  2 => "Judul diambil",
  3 => "Dosen sepakat",
  4 => "Publikasi proposal",
  5 => "Proposal diterima",
  6 => "penerbitan SK skripsi",
  7 => "monitoring skripsi",
  8 => "Permohonan ujian skripsi",
  9 => "Verifikasi syarat ujian",
  10 => "Ujian skripsi",
  11 => "Hasil ujian",
  12 => "Acc revisi",
  13 => "Skripsi selesai"
}

# status
(1..13).each do |i|
  TopicStatus.create(:description => "#{status_name[i]}")
end