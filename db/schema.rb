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

ActiveRecord::Schema.define(version: 20160922025259) do

  create_table "agenda_items", force: :cascade do |t|
    t.string   "title"
    t.datetime "meeting_date"
    t.string   "identifier"
    t.string   "organization"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "deputations", force: :cascade do |t|
    t.integer  "speaker_id"
    t.integer  "presenter_id"
    t.integer  "agenda_item_id"
    t.string   "video_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["agenda_item_id"], name: "index_deputations_on_agenda_item_id"
    t.index ["presenter_id"], name: "index_deputations_on_presenter_id"
    t.index ["speaker_id"], name: "index_deputations_on_speaker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "organization"
    t.string   "postal_address"
    t.string   "phone"
    t.string   "email"
    t.boolean  "is_presenter"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "login_token"
    t.datetime "login_token_valid_until"
  end

end
