class PeopleController < ApplicationController

  before_action :authenticate_user!
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  LIKE_FILTERS = ['first_name', 'family_name']

  # GET /people
  # GET /people.json
  def index

    respond_to do |format|
      @people = Person.all.order(:s_n)
      format.xlsx {
        render(
            xlsx: "index",
            filename: "Personen_#{Time.zone.now.localtime.to_formatted_s(:excel)}.xlsx",
            disposition: 'inline'
        )
      }
      format.html {
        @people = Person.all.order(:s_n)
        render :index
      }
      format.json {
        #"sort"=>"s_n", "order"=>"asc", "offset"=>"0", "limit"=>"5"

        filter = params['filter']

        @people = Person.all

        if filter.present?
          filter = JSON.parse filter
          filter.each do |k, v|
            if LIKE_FILTERS.include? k
              @people = @people.where("#{k} LIKE ?",  "%#{v}%")
            else
              @people = @people.where(k => v)
            end
          end
        end
        # search = params['search']
        # if search.present?
        #   @people = @people.where("s_n = ? OR register_number = ? OR first_name LIKE ? OR family_name LIKE ?", "#{search}", "#{search}", "%#{search}%", "%#{search}%")
        # end

        total = @people.count

        @people = @people.offset(params['offset']).limit(params['limit']).order("#{params['sort']} #{params['order']}")

        render json: {
            total: total,
            rows: @people
        }
      }
    end


  end

  def lawyers
    respond_to do |format|
      format.json {
        lawyers = {}
        Person.distinct.pluck(:lawyer).each{|x| lawyers[x] = x}
        render json: lawyers
      }
    end
  end


  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.includes({comments: [:person, :user]}).order('comments.id desc').find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:s_n, :register_number, :first_name, :family_name, :lawyer, :contact_persons)
  end

end
