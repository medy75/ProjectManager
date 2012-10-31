class AddForeignKeysIntoIssuesAndProjects < ActiveRecord::Migration
  def up
  	add_foreign_key :issues, :project
  end

  def down
  end
end
