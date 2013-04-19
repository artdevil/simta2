# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130414235256) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_attachments", :force => true do |t|
    t.string   "attachment_name"
    t.string   "admin_attachmentable_type"
    t.integer  "admin_attachmentable_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "admin_configs", :force => true do |t|
    t.integer  "max_lecture_student_proposal"
    t.integer  "max_lecture_student_scription"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "admin_users", :force => true do |t|
    t.string   "username",                             :default => "", :null => false
    t.string   "keyid",                  :limit => 10, :default => "", :null => false
    t.string   "user_type"
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "admin_users", ["keyid"], :name => "index_admin_users_on_keyid", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "attachments", :force => true do |t|
    t.string   "attachment_name"
    t.integer  "attachmentable_id"
    t.string   "attachmentable_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "contact_infos", :force => true do |t|
    t.integer "user_info_id"
    t.string  "contact_type"
    t.string  "contact_info"
  end

  create_table "document_categories", :force => true do |t|
    t.string "name"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.integer  "document_category_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "ancestry"
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.string   "status_description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.date     "read_at"
  end

  create_table "proposals", :force => true do |t|
    t.integer  "student_id"
    t.integer  "lecture_id"
    t.integer  "topic_id"
    t.integer  "progress",               :default => 0,     :null => false
    t.integer  "assistant_id"
    t.boolean  "assistant_confirmation"
    t.boolean  "done",                   :default => false, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "todo_proposals", :force => true do |t|
    t.integer  "proposal_id"
    t.integer  "student_id"
    t.integer  "lecture_id"
    t.integer  "create_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "done",        :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "slug"
  end

  add_index "todo_proposals", ["slug"], :name => "index_todo_proposals_on_slug", :unique => true

  create_table "topic_statuses", :force => true do |t|
    t.string "description"
  end

  create_table "topics", :force => true do |t|
    t.integer  "lecture_id"
    t.string   "title"
    t.text     "description"
    t.string   "tag_list"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "tag_id"
    t.boolean  "confirmation",    :default => false, :null => false
    t.string   "slug"
    t.integer  "topic_status_id", :default => 1,     :null => false
  end

  add_index "topics", ["slug"], :name => "index_topics_on_slug", :unique => true

  create_table "user_infos", :force => true do |t|
    t.integer "user_id"
    t.date    "birthday"
    t.string  "gender"
    t.string  "religion"
  end

  create_table "user_statuses", :force => true do |t|
    t.string "description"
  end

  create_table "users", :force => true do |t|
    t.string   "keyid",                  :limit => 10, :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "name"
    t.string   "user_type",                                            :null => false
    t.string   "avatar"
    t.integer  "user_status_id",                       :default => 1,  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "slug"
    t.string   "limit_proposal"
    t.string   "limit_scription"
  end

  add_index "users", ["keyid"], :name => "index_users_on_keyid", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
