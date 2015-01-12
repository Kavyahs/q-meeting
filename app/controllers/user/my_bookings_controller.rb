class User::MyBookingsController < User::BaseController
  def new
  end
      
  def index
	end

	def set_navs
    set_nav("user/my_bookings")
  end
end
