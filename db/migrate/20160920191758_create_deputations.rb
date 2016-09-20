class CreateDeputations < ActiveRecord::Migration[5.0]
  def change
    create_table :deputations do |t|
      t.references :speaker, foreign_key: true
      t.references :presenter, foreign_key: true
      t.references :agenda_item, foreign_key: true
      t.string :video_url

      t.timestamps
    end
  end
end
