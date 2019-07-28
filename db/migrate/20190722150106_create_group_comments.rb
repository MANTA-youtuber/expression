class CreateGroupComments < ActiveRecord::Migration[5.2]
  def change
    create_table :group_comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :group_topic, foreign_key: true

      t.timestamps
    end
  end
end
