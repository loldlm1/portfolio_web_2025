class CreateWebProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :web_projects, id: :uuid do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
