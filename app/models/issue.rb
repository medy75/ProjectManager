class Issue < ActiveRecord::Base
  attr_accessible :description, :estimate, :label, :status, :title
end
