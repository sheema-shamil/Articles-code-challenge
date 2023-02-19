class Author
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def articles
    Article.all.select { |article| article.author == self }
  end

  def magazines
    articles.map { |article| article.magazine }.uniq
  end

  def add_article(magazine, title)
    Article.new(self, magazine, title)
  end

  def topic_areas
    magazines.map { |magazine| magazine.category }.uniq
  end
end

class Magazine
  attr_accessor :name, :category

  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end

  def contributors
    Article.all.select { |article| article.magazine == self }
               .map { |article| article.author }
  end

  def article_titles
    Article.all.select { |article| article.magazine == self }
               .map { |article| article.title }
  end

  def contributing_authors
    contributors.group_by(&:name)
               .select { |author_name, authors| authors.size > 2 }
               .values
               .flatten
               .uniq
  end
end

class Article
  attr_reader :author, :magazine, :title

  @@all = []

  def initialize(author, magazine, title)
    @author = author
    @magazine = magazine
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end
end

# Sample instances
author1 = Author.new("Jane Doe")
author2 = Author.new("John Smith")

magazine1 = Magazine.new("Science Today", "Science")
magazine2 = Magazine.new("Gourmet", "Food")
magazine3 = Magazine.new("Sports Illustrated", "Sports")

article1 = Article.new(author1, magazine1, "The Latest Discoveries in Space")
article2 = Article.new(author1, magazine2, "The Best Recipes for Winter Comfort Food")
article3 = Article.new(author2, magazine2, "A Beginner's Guide to Baking Bread")
article4 = Article.new(author2, magazine3, "The Top Athletes of the Year")

# Testing methods
puts author1.name
# Output: Jane Doe

puts magazine2.name
# Output: Gourmet

puts Article.all.length
# Output: 4

puts author1.articles.length
# Output: 2

puts magazine2.contributors.length
# Output: 2

puts author1.add_article(magazine3, "Training Tips for Runners").title
# Output: Training Tips for Runners

puts magazine2.article_titles
# Output: ["The Best Recipes for Winter Comfort Food", "A Beginner's Guide to Baking Bread"]

puts magazine2.contributing_authors.map(&:name)
# Output: ["Jane Doe", "John Smith"]
