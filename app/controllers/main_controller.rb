class MainController < ApplicationController
	def index
		@pos = Post.order('id').reverse
		@tags = Hash.new{0}
		for p in @pos do
			p.tags.split(", ").each do |t|
				@tags[t.capitalize] += 1
			end
		end

		@values = @tags.sort_by{|key, value| value}.reverse
	end

	def tag
		@tag = Post.order('id').reverse

		@tags = Hash.new{0}
		for p in @tag do
			p.tags.split(", ").each do |t|
				@tags[t.capitalize] += 1
			end
		end
		@values = @tags.sort_by{|key, value| value}.reverse

		@array = []
		@tag.each do |tg|
			tg.tags.split(", ").each do |string|
				if (string.downcase == params[:tag].downcase)
					@array[@array.size] = tg
				end
			end
		end
		puts
		puts "array"
		@array.each do |qwe|
			puts qwe.tags
		end
		@pos = @array

	end

	def create_post
		if params[:title] != "" && params[:text] != "" && params[:tags] != ""
			@pos = Post.new
			@pos.title = params[:title]
			@pos.text = params[:text]
			@pos.user = params[:user]
			@pos.tags = params[:tags]
			@pos.save
			redirect_to :controller => 'main', :action => 'index', :error => "nothing"
		else
			redirect_to :controller => 'main', :action => 'index', :error => "nothing"
		end
	end

	def create_post_tag
		if params[:title] != "" && params[:text] != "" && params[:tags] != ""
			@pos = Post.new
			@pos.title = params[:title]
			@pos.text = params[:text]
			@pos.user = params[:user]
			@pos.tags = params[:tags]
			@pos.save
			redirect_to :controller => 'main', :action => 'tag', :tag => params[:tag]
		else
			redirect_to :controller => 'main', :action => 'tag', :tag => params[:tag], :error => "nothing"
		end
	end

	def delete_post
		if params[:postid] != nil
			Post.where("id" => params[:postid]).delete_all
		end
		redirect_to(:back)
	end

	def post
		@pos = Post.order('id').reverse
		@tags = Hash.new{0}
		for p in @pos do
			p.tags.split(", ").each do |t|
				@tags[t.capitalize] += 1
			end
		end
		@values = @tags.sort_by{|key, value| value}.reverse
		if params[:id]
			@post = Post.where('id = ?', params[:id])
			@comm = Comment.where('postid = ?', params[:id]).order('id').reverse
		end
	end
	def user
		if params[:username]
			@tag = Post.order('id').reverse
			@tags = Hash.new{0}
			for p in @tag do
				p.tags.split(", ").each do |t|
					@tags[t.capitalize] += 1
				end
			end
			@values = @tags.sort_by{|key, value| value}.reverse
			@pos = Post.where('user = ?', params[:username])
		end
	end
	def create_comment
		if params[:postid] != "" && params[:user]!= "" && params[:text]!= ""
			@co = Comment.new
			@co.postid = params[:postid]
			@co.user = params[:user]
			@co.text = params[:text]
			@co.save
		end
		redirect_to :controller => 'main', :action => 'post', :id => params[:postid]
	end
	def register
		@pos = Post.order('id').reverse
		@tags = Hash.new{0}
		for p in @pos do
			p.tags.split(", ").each do |t|
				@tags[t.capitalize] += 1
			end
		end
		@values = @tags.sort_by{|key, value| value}.reverse
	end
	def register_user
		if (User.find(:first, :conditions => [ "username = ?", params[:username]]) != nil)
			redirect_to :controller => 'main', :action => 'register', :error => "registered"
		elsif (params[:name] != "" && params[:surname] != "" && params[:username] != "" && params[:password] != "")
			@us = User.new
			@us.name = params[:name]
			@us.surname = params[:surname]
			@us.username = params[:username]
			@us.password = params[:password]
			@us.save
  			cookies[:user_name] = params[:username]
			redirect_to(:back)
		else
			redirect_to :controller => 'main', :action => 'register', :error => "nothing"
		end

	end
	def log_in
		@pos = Post.order('id').reverse
		@tags = Hash.new{0}
		for p in @pos do
			p.tags.split(", ").each do |t|
				@tags[t.capitalize] += 1
			end
		end
		@values = @tags.sort_by{|key, value| value}.reverse
	end
	def log_in_user
		@user = User.find(:first, :conditions => [ "username = ?", params[:username]])
		if(@user != nil && @user.password == params[:password])
	  		cookies[:user_name] = params[:username]
			redirect_to :controller => 'main', :action => 'index'
		else
			redirect_to :controller => 'main', :action => 'log_in', :error => "error"
		end
	end
	def log_out
		cookies.delete :user_name
		redirect_to :controller => 'main', :action => 'index'
	end
	def rate_comment
		@comment = Comment.find(:first, :conditions => [ "id = ?", params[:id]])
		if(@comment != nil)
			if(params[:user] == cookies[:user_name])
				bool = 0
				for string in @comment.users_voted.split(", ")
					if(string == User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s)
						bool = 1
					end
				end
				if(bool == 0)
					if(params[:sign] == "+")
						@comment.rating += 1
						@comment.users_voted += ', '+User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s
					elsif(params[:sign] == "-")
						@comment.rating -= 1
						@comment.users_voted += ', '+User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s
					end
					@comment.save
				end
			end
		end
		redirect_to(:back)
	end
	def rate_post
		@post = Post.find(:first, :conditions => [ "id = ?", params[:id]])
		if(@post != nil)
			if(params[:user] == cookies[:user_name])
				bool = 0
				for string in @post.users_voted.split(", ")
					if(string == User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s)
						bool = 1
					end
				end
				if(bool == 0)
					if(params[:sign] == "+")
						@post.rating += 1
						@post.users_voted += ', '+User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s
					elsif(params[:sign] == "-")
						@post.rating -= 1
						@post.users_voted += ', '+User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s
					end
					@post.save
				end
			end
		end
		redirect_to(:back)
	end
	def rate_user
		@user = User.find(:first, :conditions => [ "id = ?", params[:id]])
		if(@user != nil)
			if(params[:user] == cookies[:user_name])
				bool = 0
				for string in @user.users_voted.split(", ")
					if(string == User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s)
						bool = 1
					end
				end
				if(bool == 0)
					if(params[:sign] == "+")
						@user.rating += 1
						@user.users_voted += ', '+User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s
					elsif(params[:sign] == "-")
						@user.rating -= 1
						@user.users_voted += ', '+User.find(:first, :conditions => [ "username = ?", params[:user]]).id.to_s
					end
					@user.save
				end
			end
		end
		redirect_to(:back)
	end

	def search_ajax
		#render :json => params[:tag]
		if(params[:tag] != "")
			@pos = Post.order('id').reverse
			@array = []
			for post in @pos
				post.tags.split(", ").each do |string|
					@array[@array.size] = string.downcase
				end
			end
			@new_array = []
			@array.uniq!
			for tag in @array
				if tag =~ Regexp.new("^"+params[:tag])
					@new_array[@new_array.size] = tag
				end
			end
			@pos = @new_array
			if(@new_array.size > 0)
				render :json => @pos
			else
				render :json => ""
			end
		else
			render :json => ""
		end
	end
end
