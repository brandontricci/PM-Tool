class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :date
      t.boolean :complete
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
