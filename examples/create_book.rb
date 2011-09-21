require 'java'
require '../vendor/epublib-core-3.0-SNAPSHOT-complete.jar'
java_import 'java.io.FileInputStream'
java_import 'java.io.FileOutputStream'
java_import 'nl.siegmann.epublib.domain.Book'
java_import 'nl.siegmann.epublib.domain.Author'
java_import 'nl.siegmann.epublib.domain.Resource'
java_import 'nl.siegmann.epublib.epub.EpubWriter'

path = Dir.pwd + '/book'

# Create new Book
book = Book.new
# Set the title
book.getMetadata.addTitle("Epublib Test Book")
# Add an author
book.getMetadata.addAuthor(Author.new("Joe", "Tester"))
# Set cover page
book.setCoverPage(Resource.new(FileInputStream.new("#{path}/cover.html"), "cover.html"))
# Set cover image
book.setCoverImage(Resource.new(FileInputStream.new("#{path}/cover.png"), "cover.png"))
# Add Chapter 1
book.addSection("Introduction", Resource.new(FileInputStream.new("#{path}/chapter1.html"), "chapter1.html"))
# Add css file
book.addResource(Resource.new(FileInputStream.new("#{path}/book1.css"), "#{path}.css"))
# Add Chapter 2
chapter2 = book.addSection("Second Chapter", Resource.new(FileInputStream.new("#{path}/chapter2.html"), "chapter2.html"))
# Add image used by Chapter 2
book.addResource(Resource.new(FileInputStream.new("#{path}/flowers.jpg"), "flowers.jpg"))
# Add Chapter2, Section 1
book.addSection(chapter2, "Chapter 2, section 1", Resource.new(FileInputStream.new("#{path}/chapter2_1.html"), "chapter2_1.html"))
# Add Chapter 3
book.addSection("Conclusion", Resource.new(FileInputStream.new("#{path}/chapter3.html"), "chapter3.html"))
# Create EpubWriter
epubWriter = EpubWriter.new
# Write the Book as Epub
epubWriter.write(book, FileOutputStream.new("#{path}/test_book.epub"))
