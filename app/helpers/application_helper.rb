module ApplicationHelper
	def signed_in?
		if session[:customer_id].nil?
			return
		else
			@current_customer = Customer.find_by_auth_token!(cookies[:auth_token])
		end
	end
end
