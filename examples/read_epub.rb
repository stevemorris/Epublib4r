require 'epublib4r'

# Read EPUB file
ebook = Epublib4r::Ebook.new('book/test_book.epub')

# Print the first title
titles = ebook.titles
puts "Book Title: #{titles.first}"
