class AddStoryPointToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :points_estimate, :integer
  end
end
