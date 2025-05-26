# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_26_195922) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "historial_jugadas", force: :cascade do |t|
    t.bigint "jugada_id", null: false
    t.bigint "jugador_id", null: false
    t.string "clima"
    t.integer "puntos_obtenidos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jugada_id"], name: "index_historial_jugadas_on_jugada_id"
    t.index ["jugador_id"], name: "index_historial_jugadas_on_jugador_id"
  end

  create_table "jugadas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jugadors", force: :cascade do |t|
    t.string "nombre"
    t.integer "dinero"
    t.string "clima"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "historial_jugadas", "jugadas"
  add_foreign_key "historial_jugadas", "jugadors"
end
