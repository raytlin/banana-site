class BananasController < ApplicationController
  # GET /bananas
  # GET /bananas.xml
  
  before_filter :authorize_access
  
  def index
    @bananas = Banana.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bananas }
    end
  end

  # GET /bananas/1
  # GET /bananas/1.xml
  def show
    @banana = Banana.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banana }
    end
  end

  # GET /bananas/new
  # GET /bananas/new.xml
  def new
    @banana = Banana.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banana }
    end
  end

  # GET /bananas/1/edit
  def edit
    @banana = Banana.find(params[:id])
  end

  # POST /bananas
  # POST /bananas.xml
  def create
    @banana = Banana.new(params[:banana])

    respond_to do |format|
      if @banana.save
        format.html { redirect_to(@banana, :notice => 'Banana was successfully created.') }
        format.xml  { render :xml => @banana, :status => :created, :location => @banana }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banana.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bananas/1
  # PUT /bananas/1.xml
  def update
    @banana = Banana.find(params[:id])

    respond_to do |format|
      if @banana.update_attributes(params[:banana])
        format.html { redirect_to(@banana, :notice => 'Banana was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banana.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bananas/1
  # DELETE /bananas/1.xml
  def destroy
    @banana = Banana.find(params[:id])
    @banana.destroy

    respond_to do |format|
      format.html { redirect_to(bananas_url) }
      format.xml  { head :ok }
    end
  end
end
