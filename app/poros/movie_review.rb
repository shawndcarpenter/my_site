class MovieReview
  attr_reader :author, :content, :name, :viewername, :avatar_path, :rating

  def initialize(review_data)
    @author = review_data[:author]
    @content = review_data[:content]
    @name = review_data[:author_details][:name]
    @viewername = review_data[:author_details][:username]
    @avatar_path = review_data[:author_details][:avatar_path]
    @rating = review_data[:author_details][:rating]
  end
end