class ProgramsController < ApplicationController
  before_filter :require_user
  before_filter :one_per_user, only: :new

  respond_to :html

  def new
    @program = @current_user.build_program
  end

  def create
    @program = @current_user.build_program(params[:program])

    respond_with @program do |format|
      format.html do
        @program.save ?
          redirect_to(program_path) :
          render(:new)
      end
    end
  end

  def edit
    @program = @current_user.program
  end

  def update
    @program = @current_user.program
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
    @program = @current_user.program
  end

  private

  def one_per_user
    if (program = @current_user.program)
      redirect_to program_path
    end
  end

end
