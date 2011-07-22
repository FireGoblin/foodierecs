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

ActiveRecord::Schema.define(:version => 20110721232135) do

  create_table "feeds", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mappings", :force => true do |t|
    t.integer  "restaurant_id1"
    t.integer  "restaurant_id2"
    t.integer  "foodies"
    t.integer  "nonfoodie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nominations", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "vote"
    t.integer  "voter"
    t.boolean  "nominator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opinions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.boolean  "foodie"
    t.integer  "like"
    t.string   "to_eat"
    t.string   "to_drink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "street_number"
    t.string   "street"
    t.string   "phone"
    t.float    "lat"
    t.float    "long"
    t.string   "icon"
    t.string   "google_id"
    t.string   "reference"
    t.string   "type1"
    t.string   "type2"
    t.string   "type3"
    t.string   "type4"
    t.string   "url"
    t.string   "vicinity"
    t.float    "rating"
    t.integer  "foodie_likes"
    t.integer  "foodie_dislikes"
    t.integer  "normal_likes"
    t.integer  "normal_dislikes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "formatted_name"
    t.string   "borough"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "facebook_url"
    t.boolean  "foodie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
