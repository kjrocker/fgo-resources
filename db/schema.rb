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

ActiveRecord::Schema.define(version: 20170521204343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_tags", force: :cascade do |t|
    t.integer "card_id"
    t.integer "tag_id"
    t.index ["card_id", "tag_id"], name: "index_card_tags_on_card_id_and_tag_id", using: :btree
    t.index ["card_id"], name: "index_card_tags_on_card_id", using: :btree
    t.index ["tag_id", "card_id"], name: "index_card_tags_on_tag_id_and_card_id", using: :btree
    t.index ["tag_id"], name: "index_card_tags_on_tag_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "official_id"
    t.string   "name"
    t.integer  "rarity"
    t.integer  "servant_class_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "type"
    t.string   "avatar"
    t.json     "portraits"
    t.index ["servant_class_id"], name: "index_cards_on_servant_class_id", using: :btree
  end

  create_table "servant_classes", force: :cascade do |t|
    t.string  "name"
    t.string  "icon"
    t.integer "sort_order"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  add_foreign_key "card_tags", "cards"
  add_foreign_key "card_tags", "tags"
  add_foreign_key "cards", "servant_classes"
end
