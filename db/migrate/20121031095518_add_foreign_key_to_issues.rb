class AddForeignKeyToIssues < ActiveRecord::Migration
  def change
  end
  
  def up
  	add_foreign_key :issues, :projects
  end
end
