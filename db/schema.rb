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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170727215030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "binaries", force: :cascade do |t|
    t.string   "name"
    t.string   "extension"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "folder_id"
    t.string   "data_url"
    t.integer  "status",     default: 0
    t.index ["folder_id"], name: "index_binaries_on_folder_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "binary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["binary_id"], name: "index_comments_on_binary_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "fb_comments", force: :cascade do |t|
    t.string   "fb_uid"
    t.string   "fb_uname"
    t.integer  "like_count"
    t.integer  "comment_count"
    t.string   "message"
    t.integer  "meta_data_photo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["meta_data_photo_id"], name: "index_fb_comments_on_meta_data_photo_id", using: :btree
  end

  create_table "fb_places", force: :cascade do |t|
    t.string "fb_place_id"
    t.string "name"
    t.string "city"
    t.string "country"
    t.float  "lat"
    t.float  "long"
  end

  create_table "fb_reactions", force: :cascade do |t|
    t.string   "fb_uid"
    t.string   "fb_uname"
    t.string   "reaction_type"
    t.integer  "meta_data_photo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["meta_data_photo_id"], name: "index_fb_reactions_on_meta_data_photo_id", using: :btree
  end

  create_table "fb_tags", force: :cascade do |t|
    t.string   "fb_uid"
    t.string   "fb_uname"
    t.integer  "meta_data_photo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["meta_data_photo_id"], name: "index_fb_tags_on_meta_data_photo_id", using: :btree
  end

  create_table "folders", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "folder_id"
    t.string   "route"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "permission", default: 0
    t.string   "slug"
    t.integer  "status",     default: 0
    t.index ["folder_id"], name: "index_folders_on_folder_id", using: :btree
    t.index ["slug"], name: "index_folders_on_slug", using: :btree
    t.index ["user_id"], name: "index_folders_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "meta_data_files", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "binaries_id"
    t.string   "text"
    t.integer  "word_count"
    t.string   "top_adjective", default: [],              array: true
    t.string   "top_noun",      default: [],              array: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["binaries_id"], name: "index_meta_data_files_on_binaries_id", using: :btree
    t.index ["user_id"], name: "index_meta_data_files_on_user_id", using: :btree
  end

  create_table "meta_data_photos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "width"
    t.integer  "height"
    t.string   "model"
    t.string   "shutter_speed"
    t.float    "aperture"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image"
    t.string   "created_time"
    t.string   "fb_uname"
    t.string   "fb_uid"
    t.string   "fb_photo_id"
    t.integer  "fb_place_id"
    t.index ["fb_place_id"], name: "index_meta_data_photos_on_fb_place_id", using: :btree
    t.index ["user_id"], name: "index_meta_data_photos_on_user_id", using: :btree
  end

  create_table "shared_folders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_shared_folders_on_folder_id", using: :btree
    t.index ["user_id"], name: "index_shared_folders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "fb_id"
    t.integer  "status",            default: 0
    t.string   "email"
    t.string   "phone"
    t.string   "token"
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.string   "password_digest"
    t.integer  "role",              default: 0
    t.string   "verification_code"
    t.string   "avatar_url",        default: "https://thumb.ibb.co/htakav/default_profile.jpg"
  end

  add_foreign_key "binaries", "folders"
  add_foreign_key "comments", "binaries"
  add_foreign_key "comments", "users"
  add_foreign_key "fb_comments", "meta_data_photos"
  add_foreign_key "fb_reactions", "meta_data_photos"
  add_foreign_key "fb_tags", "meta_data_photos"
  add_foreign_key "folders", "folders"
  add_foreign_key "folders", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "meta_data_files", "binaries", column: "binaries_id"
  add_foreign_key "meta_data_files", "users"
  add_foreign_key "meta_data_photos", "users"
  add_foreign_key "shared_folders", "folders"
  add_foreign_key "shared_folders", "users"
end
