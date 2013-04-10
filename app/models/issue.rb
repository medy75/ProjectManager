class Issue < ActiveRecord::Base
  STATUS = ['backlog', 'sprintlog', 'in progress', 'testing', 'done']
  attr_accessible :description, :estimate, :label, :status, :title, :project_id, :points_estimate
  belongs_to :project
  validates :title, :presence => true
  validates :estimate, :numericality => {:greater_than_or_equal_to => 0.1}
  validates :points_estimate, :numericality => {:greater_than_or_equal_to => 0}
end
