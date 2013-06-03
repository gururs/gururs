class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :event, index: true, null: false
      t.references :user, index: true
      t.string :title, null: false
      t.string :video_code
      t.string :audio_code

      t.timestamps
    end
  end
end
