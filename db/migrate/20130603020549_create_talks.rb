class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :event, index: true, null: false
      t.references :user, index: true
      t.string :title, null: false
      t.integer :video_id
      t.integer :audio_id

      t.timestamps
    end
  end
end
