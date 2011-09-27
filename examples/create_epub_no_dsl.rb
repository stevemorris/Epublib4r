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

# Add CSS file
ebook.style_sheet = 'book/book1.css'

# Add Chapter 1
ebook.section = { title: 'Introduction', path: 'book/chapter1.html' }

# Add Chapter 2
chapter2 = 'book/chapter2.html'
ebook.section = { title: 'Second Chapter', path: chapter2 }

# Add image used by Chapter 2
ebook.image = 'book/flowers.jpg'

# Add Chapter2, Section 1
ebook.section = { title: 'Chapter 2, section 1', path: 'book/chapter2_1.html', parent: chapter2 }

# Add Chapter 3
ebook.section = { title: 'Conclusion', path: 'book/chapter3.html' }

# Write the ebook as EPUB
ebook.write('book/test_book.epub')
