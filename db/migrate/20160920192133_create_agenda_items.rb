class CreateAgendaItems < ActiveRecord::Migration[5.0]
  def change
    create_table :agenda_items do |t|
      t.string :title
      t.datetime :meeting_date
      t.string :identifier
      t.string :organization

      t.timestamps
    end
  end
end
