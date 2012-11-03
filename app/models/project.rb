class Project < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :issues, :dependent => :destroy
  accepts_nested_attributes_for :issues, :allow_destroy => :true
end
