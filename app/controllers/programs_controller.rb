class ProgramsController < ApplicationController
  respond_to :html

  before_filter :require_user


  def new
    @users   = User.all
    @program = Program.new
  end

  def create
    @program = Program.new(params[:program])

    respond_with @program do |format|
      format.html do
        @program.save ?
          redirect_to(program_path(@program)) :
          render(:new)
      end
    end
  end

  def edit
    @users   = User.all
    @program = @current_user.programs.find(params[:id])
  end

  def update
    @program = @current_user.programs.find(params[:id])
    @program.update_attributes(params[:program])
    respond_with @program do |format|
      format.html do
        @program.save ?
          redirect_to(program_path) :
          render(:edit)
      end
    end
  end

  def show
    @program = Program.find(params[:id])
  end

end
