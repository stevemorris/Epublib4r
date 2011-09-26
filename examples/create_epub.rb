require 'epublib4r'

# Create new ebook
ebook = Epublib4r::Ebook.new

# Set the title
ebook.title = 'Epublib4r Test Book'

# Add an author
ebook.author = 'Joe', 'Tester'

# Set cover page
ebook.cover_page = 'book/cover.html'

# Set cover image
ebook.cover_image = 'book/cover.png'

# Add Chapter 1
ebook.section = { title: 'Introduction', file: 'book/chapter1.html' }

# Add CSS file
ebook.resource = 'book/book1.css'

# Add Chapter 2
chapter2 = ebook.section = { title: 'Second Chapter', file: 'book/chapter2.html' }

# Add image used by Chapter 2
ebook.resource = 'book/flowers.jpg'

# Add Chapter2, Section 1
ebook.section = { title: 'Chapter 2, section 1', file: 'book/chapter2_1.html', parent: 'Second Chapter' }

# Add Chapter 3
ebook.section = { title: 'Conclusion', file: 'book/chapter3.html' }

# Write the ebook as EPUB
Epublib4r::Writer.write_file(ebook, 'book/test_book.epub')
