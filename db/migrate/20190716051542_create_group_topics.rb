class CreateGroupTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :group_topics do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.string :description
      t.string :image
      
      t.timestamps
    end
  end
end
