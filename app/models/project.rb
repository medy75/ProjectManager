class Project < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :issues, :dependent => :destroy
  has_and_belongs_to_many :users, :uniq => true
  accepts_nested_attributes_for :issues, :allow_destroy => :true
end
