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

ActiveRecord::Schema.define(version: 0) do

  create_table "grocer_exports", force: :cascade do |t|
    t.string   "pid"
    t.integer  "job"
    t.string   "status"
    t.datetime "last_error"
    t.datetime "last_success"
    t.string   "logfile"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["pid"], name: "index_grocer_exports_on_pid", unique: true
  end

end
