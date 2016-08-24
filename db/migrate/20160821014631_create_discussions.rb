class CreateDiscussions < ActiveRecord::Migration[5.0]
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :description
      t.references :project, foreign_key: true, index: true
      t.timestamps
    end
  end
end
