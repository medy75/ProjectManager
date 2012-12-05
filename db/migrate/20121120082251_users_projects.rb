class UsersProjects < ActiveRecord::Migration
  def up
  	create_table 'users_projects', :id => false do |t|
    	t.column :user_id, :integer
    	t.column :project_id, :integer
  	end
  end

  def down
  end
end
