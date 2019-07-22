class AddTitleToGroupTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :group_topics, :title, :string
  end
end
