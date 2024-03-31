class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.text :question
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
