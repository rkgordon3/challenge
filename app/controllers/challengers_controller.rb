class ChallengersController < ApplicationController

  before_filter :reject, :only => [:new, :index]

  def reject
    redirect_to root_path
  end

  def status
  end

  def challenge
    email = params[:name]
    @message = nil
    @c = Challenger.find_by_email(email.downcase)
    @message = "You must be a CS major to accept the challenge." if @c.nil?
    @message = "You have already accepted the challenge. Start Training!" if (not @c.nil?) && @c.accepted

    if not @message.nil?
      render "error"
    else
      @c.accepted = true
      @c.save
      render "challenge"
    end

  end
  # GET /challengers
  # GET /challengers.json
  def index
    @challengers = Challenger.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @challengers }
    end
  end

  # GET /challengers/1
  # GET /challengers/1.json
  def show
    @challenger = Challenger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @challenger }
    end
  end

  # GET /challengers/new
  # GET /challengers/new.json
  def new
    @challenger = Challenger.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @challenger }
    end
  end

  # GET /challengers/1/edit
  def edit
    @challenger = Challenger.find(params[:id])
  end

  # POST /challengers
  # POST /challengers.json
  def create
    @challenger = Challenger.new(params[:challenger])

    respond_to do |format|
      if @challenger.save
        format.html { redirect_to @challenger, notice: 'Challenger was successfully created.' }
        format.json { render json: @challenger, status: :created, location: @challenger }
      else
        format.html { render action: "new" }
        format.json { render json: @challenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /challengers/1
  # PUT /challengers/1.json
  def update
    @challenger = Challenger.find(params[:id])

    respond_to do |format|
      if @challenger.update_attributes(params[:challenger])
        format.html { redirect_to @challenger, notice: 'Challenger was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challengers/1
  # DELETE /challengers/1.json
  def destroy
    @challenger = Challenger.find(params[:id])
    @challenger.destroy

    respond_to do |format|
      format.html { redirect_to challengers_url }
      format.json { head :no_content }
    end
  end
end
