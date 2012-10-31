class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :label
      t.text :description
      t.string :status
      t.decimal :estimate

      t.timestamps
    end
  end

end
