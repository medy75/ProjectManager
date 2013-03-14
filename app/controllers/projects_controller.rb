class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @issues = @project.issues
    @backlog_points = 0
    @sprintlog_points = 0
    @progress_points = 0
    @test_points = 0
    @done_points = 0
    @remain_points = 0
    @total_points = 0

    @backlog_issues = @issues.select {|issue| issue.status=="backlog"}
    @sprintlog_issues = @issues.select {|issue| issue.status=="sprintlog"}
    @progress_issues = @issues.select {|issue| issue.status=="in progress"}
    @test_issues = @issues.select {|issue| issue.status=="testing"}
    @done_issues = @issues.select {|issue| issue.status=="done"}

    @backlog_issues.each do |backlog_issue|
      @backlog_points += backlog_issue.points_estimate if backlog_issue.points_estimate
    end
    @sprintlog_issues.each do |sprintlog_issue|
      @sprintlog_points += sprintlog_issue.points_estimate if sprintlog_issue.points_estimate
    end
    @progress_issues.each do |progress_issue|
      @progress_points += progress_issue.points_estimate if progress_issue.points_estimate
    end
    @test_issues.each do |test_issue|
      @test_points += test_issue.points_estimate if test_issue.points_estimate
    end
    @done_issues.each do |done_issue|
      @done_points += done_issue.points_estimate if done_issue.points_estimate
    end

    @remain_points = @backlog_points + @sprintlog_points + @progress_points + @test_points
    @total_points = @remain_points + @done_points
    
    # GoogleChart::PieChart.new('320x200', "Burndown pie chart",false) do |pc| 
    #  pc.data "Remain", @remain_points.to_i
    #  pc.data "Done", @done_points.to_i
    #  @chart =  pc.to_url
    # end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @project }
    end
  end

  def find
    @project = Project.new
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @user = @current_user
    @project = Project.new(params[:project])
    @project.users << User.find(current_user.id)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, :notice => 'Project was successfully created.' }
        format.json { render :json => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, :notice => 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    #@user = current_user
    @project = Project.find(params[:id])
    #@project = @user.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
