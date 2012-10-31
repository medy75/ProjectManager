class Project < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :issues, :dependent => :destroy
end
