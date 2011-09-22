require 'java'
require_relative '../vendor/epublib-core-3.0-SNAPSHOT-complete.jar'
java_import 'java.io.ByteArrayInputStream'
java_import 'java.io.ByteArrayOutputStream'
java_import 'java.io.FileInputStream'
java_import 'java.io.FileOutputStream'
java_import 'nl.siegmann.epublib.domain.Author'
java_import 'nl.siegmann.epublib.domain.Book'
java_import 'nl.siegmann.epublib.domain.GuideReference'
java_import 'nl.siegmann.epublib.domain.Identifier'
java_import 'nl.siegmann.epublib.domain.Resource'
java_import 'nl.siegmann.epublib.epub.EpubReader'
java_import 'nl.siegmann.epublib.epub.EpubWriter'

require_relative 'epublib-ruby/ebook'
require_relative 'epublib-ruby/reader'
require_relative 'epublib-ruby/utils'
require_relative 'epublib-ruby/writer'

module Epublib
end
