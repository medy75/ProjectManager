require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :issues

  test "issue title must not be empty" do
    # project = Project.new{:title=>"Test project"}
  	issue = Issue.new
  	assert issue.invalid?
  	assert issue.errors[:title].any?
  end

  test "estimate value must be positive" do
  	issue = Issue.new(:title => "Title", :description => "description", :status => "new", :label => "ruby")
  	issue.estimate = -1
  	assert issue.invalid?
  	assert_equal "must be greater than or equal to 0", issue.errors[:estimate].join("; ")
  end

  test "estimate value must be a number" do
    issue = Issue.new(:title => "Title", :description => "description", :status => "new", :label => "ruby")
    issue.estimate = "a"
    assert issue.invalid?
    assert_equal "is not a number", issue.errors[:estimate].join("; ")
  end

  test "estimate shlould be ok" do
    issue = Issue.new(:title => "Title", :description => "description", :status => "new", :label => "ruby")
  	issue.estimate = 1
  	assert issue.invalid?
  end

    test "points estimate must be a number" do
    issue = Issue.new(:title => "Title", :description => "description", :status => "new", :label => "ruby", :estimate => 2)
    issue.points_estimate = "a"
    assert issue.invalid?
    assert_equal "is not a number", issue.errors[:points_estimate].join("; ")
  end

  test "points estimate value must be positive" do
    issue = Issue.new(:title => "Title", :description => "description", :status => "new", :label => "ruby", :estimate => 2)
    issue.points_estimate = -1
    assert issue.invalid?
    assert_equal "must be greater than or equal to 0", issue.errors[:points_estimate].join("; ")
  end

  test "points estimate should be ok" do
    issue = Issue.new(:title => "Title", :description => "description", :status => "new", :label => "ruby", :estimate => 2)
    issue.points_estimate = 1
    assert issue.valid?
  end

end
