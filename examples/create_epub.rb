require 'epublib4r'

# Create new ebook
ebook = Epublib4r::Ebook.new

# Set the title
ebook.add_title('Epublib4r Test Book')

# Add an author
ebook.add_author('Joe', 'Tester')

# Set cover page
ebook.set_cover_page('book/cover.html')

# Set cover image
ebook.set_cover_image('book/cover.png')

# Add Chapter 1
ebook.add_section('Introduction', 'book/chapter1.html')

# Add CSS file
ebook.add_resource('book/book1.css')

# Add Chapter 2
chapter2 = ebook.add_section('Second Chapter', 'book/chapter2.html')

# Add image used by Chapter 2
ebook.add_resource('book/flowers.jpg')

# Add Chapter2, Section 1
ebook.add_subsection(chapter2, 'Chapter 2, section 1', 'book/chapter2_1.html')

# Add Chapter 3
ebook.add_section('Conclusion', 'book/chapter3.html')

# Write the ebook as EPUB
Epublib4r::Writer.write_file(ebook, 'book/test_book.epub')
