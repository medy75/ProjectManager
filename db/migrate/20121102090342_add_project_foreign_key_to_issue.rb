class AddProjectForeignKeyToIssue < ActiveRecord::Migration
  def change
  	
  end

  def self.up
  	add_column :issues, :project_id, :integer, :null => false
  end

  def self.down
  	remove_column :issues, :project_id
  end
end
