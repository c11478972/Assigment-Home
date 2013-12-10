class PostsController < ApplicationController
	def create
		@journal = Journal.find params[:journal_id]
		if @journal
			@post = @journal.posts.create params[:post]
			@post.customer_id = @current_customer.id
			@post.save
		end
		respond_to do |f|
			f.html{redirect_to @journal}
		end
	end 
end
