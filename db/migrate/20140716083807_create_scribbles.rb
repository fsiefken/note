class CreateScribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.string :title
      t.string :tags
      t.text :content
      t.date :created
      t.boolean :published

      t.timestamps
    end
  end
end
