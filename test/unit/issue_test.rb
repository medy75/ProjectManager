require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :issues

  test "issue title must not be empty" do
  	issue = Issue.new
  	assert issue.invalid?
  	assert issue.errors[:title].any?
  end

  test "estimate value must be positive" do
  	issue = Issue.new(:title => "Title", :description => "description", :status => "new", :label => "ruby")
  	issue.estimate = -1
  	assert issue.invalid?
  	assert_equal "must be greater than or equal to 0.1", issue.errors[:estimate].join("; ")

  	issue.estimate = 0
  	assert issue.invalid?
  	assert_equal "must be greater than or equal to 0.1", issue.errors[:estimate].join("; ")

  	issue.estimate = 1
  	assert issue.valid?
  end
end
