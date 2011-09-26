require 'epublib4r'

# Read EPUB file
ebook = Epublib4r::Reader.read_file('book/test_book.epub')

# Print the first title
titles = ebook.get_titles
puts "Book Title: #{titles.first}"
