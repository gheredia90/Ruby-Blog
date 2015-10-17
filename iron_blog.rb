class Blog

	def initialize(posts)
		@posts = posts
		@posts.sort! { |x,y| y.date <=> x.date }
	end	

	def add_post(post)
		@posts.push(post)
	end	

	def create_front_page(posts, current_page)

		current_page -= 1

		posts_current_page = posts.slice(0 + 3*current_page, 3)



		posts_current_page.each do |post|

			if post.sponsored
				puts "****** #{post.title} ******"
			else 
				puts post.title
			end	
			puts "**************"
			puts post.text
			puts "----------------"
		end	
	end	

	def publish_front_page 

		num_pages = @posts.size / 3

		add_last_page = (@posts.size % 3) != 0 ? true : false

		if add_last_page
			num_pages += 1
		end

		current_page = 1

		create_front_page(@posts, current_page)
		
	end	

	def navigate
		print "> "
		user_input = gets.chomp
		if user_input == "next"
			current_page += 1
		elsif user_input == "prev"
			current_page -= 1
		else

		end	
	end			
end


class Post

	attr_reader :title, :date, :text, :sponsored

	def initialize(title, date, text, sponsored)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end	
end



posts = [
		Post.new("Post 1 title", 1993-02-14, "Post 1 text", false),
		Post.new("Post 2 title", 1999-02-14, "Post 2 text", true), 
		Post.new("Post 3 title", 2007-02-14, "Post 3 text", false),
		Post.new("Post 4 title", 1993-02-14, "Post 4 text", false),
		Post.new("Post 5 title", 2003-02-14, "Post 5 text", false), 
		Post.new("Post 6 title", 2022-02-14, "Post 6 text", false),
		Post.new("Post 7 title", 1967-02-14, "Post 7 text", false),
		Post.new("Post 8 title", 1948-02-14, "Post 8 text", false)
		]

blog = Blog.new(posts)
blog.publish_front_page 