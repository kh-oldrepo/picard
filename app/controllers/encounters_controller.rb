class EncountersController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  # GET /encounters
  # GET /encounters.json
  def index
    @encounters = Encounter.order(sort_column + " " + sort_direction)
    @tags = Encounter.tag_counts_on(:tags)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @encounters }
    end
  end

  def tag_cloud
    @tags = Encounter.tag_counts_on(:tags)
  end
  # GET /encounters/1
  # GET /encounters/1.json
  def show
    @encounter = Encounter.find(params[:id])
    @note = Note.new(:encounter_id => @encounter.id)
    @tags = Encounter.tag_counts_on(:tags)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @encounter }
    end
  end

  def tagged
    if params[:tag].present?
      @encounters = Encounter.tagged_with(params[:tag])
    else
      @encounters = Encounter.postall
    end
  end

  # GET /encounters/new
  # GET /encounters/new.json
  def new
    @encounter = Encounter.new
    @tags = Encounter.tag_counts_on(:tags)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @encounter }
    end
  end

  # GET /encounters/1/edit
  def edit

    @tags = Encounter.tag_counts_on(:tags)
    @encounter = Encounter.find(params[:id])
  end

  # POST /encounters
  # POST /encounters.json
  def create
    @encounter = Encounter.new(params[:encounter])

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to @encounter, notice: 'Encounter was successfully created.' }
        format.json { render json: @encounter, status: :created, location: @encounter }
      else
        format.html { render action: "new" }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /encounters/1
  # PUT /encounters/1.json
  def update
    @encounter = Encounter.find(params[:id])

    respond_to do |format|
      if @encounter.update_attributes(params[:encounter])
        format.html { redirect_to @encounter, notice: 'Encounter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.json
  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy

    respond_to do |format|
      format.html { redirect_to encounters_url }
      format.json { head :no_content }
    end
  end

private

  def sort_column
    Encounter.column_names.include?(params[:sort]) ? params[:sort] : "Date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
