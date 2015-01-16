class User::BookingsController < User::BaseController
  # GET /bookings
  def index
    get_collections
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
    end
  end

  # GET /bookings/1
  def show
    ## Creating the booking object
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html { get_collections and render :index }
      format.js {}
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    ## Intitializing the booking object
    @booking = Booking.new
    @venues=Venue.all
    respond_to do |format|
      format.html { get_collections and render :index }
      format.js {}
    end
  end

  # GET /bookings/1/edit
  def edit
    ## Fetching the booking object
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html { get_collections and render :index }
      format.js {}
    end
  end

  # POST /bookings
  def create
    ## Creating the booking object
    @booking = Booking.new(booking_params)
    
    ## Validating the data
    @booking.valid?

    respond_to do |format|
      if @booking.errors.blank?

        # Saving the booking object
        @booking.save

        # Setting the flash message
        message = translate("forms.created_successfully", :item => "Booking")
        store_flash_message(message, :success)

        format.html {
          redirect_to user_booking_url(@booking), notice: message
        }
        format.json { render json: @booking, status: :created, location: @booking }
        format.js {}
      else

        # Setting the flash message
        message = @booking.errors.full_messages.to_sentence
        store_flash_message(message, :alert)

        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.js
  def update
    ## Fetching the booking
    @booking = Booking.find(params[:id])

    ## Updating the @booking object with params
    @booking.assign_attributes(booking_params)

    ## Validating the data
    @booking.valid?

    respond_to do |format|
      if @booking.errors.blank?

        # Saving the booking object
        @booking.save

        # Setting the flash message
        message = translate("forms.updated_successfully", :item => "Booking")
        store_flash_message(message, :success)

        format.html {
          redirect_to user_booking_url(@booking), notice: message
        }
        format.json { head :no_content }
        format.js {}

      else

        # Setting the flash message
        message = @booking.errors.full_messages.to_sentence
        store_flash_message(message, :alert)

        format.html {
          render action: "edit"
        }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        format.js {}

      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.js
  # DELETE /bookings/1.json
  def destroy
    ## Fetching the booking
    @booking = Booking.find(params[:id])

    respond_to do |format|
      ## Destroying the booking
      @booking.destroy
      @booking = Booking.new

      # Fetch the bookings to refresh ths list and details box
      get_collections
      @booking = @bookings.first if @bookings and @bookings.any?

      # Setting the flash message
      message = translate("forms.destroyed_successfully", :item => "Booking")
      store_flash_message(message, :success)

      format.html {
        redirect_to user_bookings_url notice: message
      }
      format.json { head :no_content }
      format.js {}

    end
  end

  private

  def set_navs
    set_nav("user/bookings")
  end

  def booking_params
    params[:booking].permit(:title, :description, :date, :from, :to, :venue_id)
  end

  def get_collections
    # Fetching the bookings
    relation = Booking.where("")
    @filters = {}

    if params[:query]
      @query = params[:query].strip
      relation = relation.search(@query) if !@query.blank?
    end

    @bookings = relation.order("title asc").page(@current_page).per(@per_page)

    ## Initializing the @booking object so that we can render the show partial
    @booking = @bookings.first unless @booking

    return true

  end
end
