class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.boolean :answer
      t.references :survey, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
