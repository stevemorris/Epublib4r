require 'epublib-ruby'

# Read EPUB file
ebook = Epublib::Reader.read_file('book/test_book.epub')

# Print the first title
titles = ebook.get_titles
puts "Book Title: #{titles.first}"
