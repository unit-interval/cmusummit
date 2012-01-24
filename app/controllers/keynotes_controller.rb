class KeynotesController < ApplicationController
  # GET /keynotes
  # GET /keynotes.json
  def index
    @keynotes = Keynote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @keynotes }
    end
  end

  # GET /keynotes/1
  # GET /keynotes/1.json
  def show
    @keynote = Keynote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @keynote }
    end
  end

  # GET /keynotes/new
  # GET /keynotes/new.json
  def new
    @keynote = Keynote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @keynote }
    end
  end

  # GET /keynotes/1/edit
  def edit
    @keynote = Keynote.find(params[:id])
  end

  # POST /keynotes
  # POST /keynotes.json
  def create
    @keynote = Keynote.new(params[:keynote])

    respond_to do |format|
      if @keynote.save
        format.html { redirect_to @keynote, :notice => 'Keynote was successfully created.' }
        format.json { render :json => @keynote, :status => :created, :location => @keynote }
      else
        format.html { render :action => "new" }
        format.json { render :json => @keynote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keynotes/1
  # PUT /keynotes/1.json
  def update
    @keynote = Keynote.find(params[:id])

    respond_to do |format|
      if @keynote.update_attributes(params[:keynote])
        format.html { redirect_to @keynote, :notice => 'Keynote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @keynote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keynotes/1
  # DELETE /keynotes/1.json
  def destroy
    @keynote = Keynote.find(params[:id])
    @keynote.destroy

    respond_to do |format|
      format.html { redirect_to keynotes_url }
      format.json { head :no_content }
    end
  end
end
