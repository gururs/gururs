class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :event, index: true, null: false
      t.references :user, index: true
      t.string :title, null: false
      t.string :video_id
      t.string :audio_id

      t.timestamps
    end
  end
end
