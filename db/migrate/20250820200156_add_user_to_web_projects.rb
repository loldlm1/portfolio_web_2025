class AddUserToWebProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :web_projects, :user, null: true, foreign_key: true, type: :uuid
    add_column :web_projects, :index, :string

    add_index :web_projects, [ :user_id, :created_at ]
  end
end
