require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :projects

  test "project title must not be empty" do
  	project = Project.new
  	assert project.invalid?
  	assert project.errors[:title].any?
  end
end
