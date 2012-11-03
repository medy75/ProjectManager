class Issue < ActiveRecord::Base
  attr_accessible :description, :estimate, :label, :status, :title, :project_id
  belongs_to :project
  validates :title, :presence => true
  validates :estimate, :numericality => {:greater_than_or_equal_to => 0.1}
end
