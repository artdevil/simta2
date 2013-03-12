# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create mahasiswa
User.create(:name => "adhiguna utama sabril", :keyid => "111128355", :password => "tes123456",:user_type => "mahasiswa" )

# create dosen
@dosen = User.create(:name => "burhanuddin dirgantara", :keyid => "111111111", :password => "tes123456", :user_type => "dosen" )

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
description = '<p><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14px; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; display: inline !important; float: none;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>'

# bikin TA
(1..11).each do |i|
  Topic.create(:lecture_id => @dosen.id.to_i, :title => "#{titles[i]}", :description => "#{description}", :tag_list => "#{meta[i]}")
end
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