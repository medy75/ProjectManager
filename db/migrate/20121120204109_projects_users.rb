class ProjectsUsers < ActiveRecord::Migration
  def up
  	create_table 'projects_users', :id => false do |t|
    	t.column :user_id, :integer
    	t.column :project_id, :integer
  	end
  end

  def down
  	drop_table 'projects_users'
  end
end
