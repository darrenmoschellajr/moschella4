class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :sessiondate
      t.integer :truck_id

      t.timestamps null: false
    end
  end
end
