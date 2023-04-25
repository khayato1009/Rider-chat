class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string     :chatroom_name, null: false
      t.references :user,          null: false, foreign_key: true
      t.integer    :room_id,       null: false
      t.timestamps
    end
  end
end
