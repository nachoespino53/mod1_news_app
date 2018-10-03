class Everything
  attr_accessor :id, :name, :author, :title, :description, :url, :urlToImage, :publishedAt

  def initialize(source, author, title, description, url, urlToImage, publishedAt)
    @id = source["id"]
    @name = source["name"]
    @author = author
    @title = title
    @description = description
    @url = url
    @urlToImage = urlToImage
    @publishedAt = publishedAt
  end
end
