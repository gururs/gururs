class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :enroll_url
      t.string :proposals_url
      t.datetime :happens_at

      t.timestamps
    end
  end
end
