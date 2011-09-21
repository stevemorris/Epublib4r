require 'java'
require '../vendor/epublib-core-3.0-SNAPSHOT-complete.jar'
java_import 'java.io.FileInputStream'
java_import 'java.io.FileOutputStream'
java_import 'nl.siegmann.epublib.domain.Book'
java_import 'nl.siegmann.epublib.domain.Author'
java_import 'nl.siegmann.epublib.domain.Resource'
java_import 'nl.siegmann.epublib.epub.EpubWriter'

require 'epublib-ruby/book'
require 'epublib-ruby/writer'

module Epublib
end
