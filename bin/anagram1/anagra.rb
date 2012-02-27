#!/usr/bin/env ruby
require 'optparse'
dictionary = "/usr/share/dict/words"
OptionParser.new do |opts|
	opts.banner = "Usage: anagram [ options ] word..."
	opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
		dictionary = dict
	end
	opts.on("-h", "--help", "Show this message") do
	puts opts
	exit
end

	begin
		ARGV << "-h" if ARGV.empty?     #añade -h a la lista si viene vacía
		opts.parse!(ARGV)
		rescue OptionParser::ParseError => e   #capturando la excepción
		STDERR.puts e.message, "\n", opts      #metodo message del objeto excepcion
		exit(-1)
	end
end

def signature_of(word)
	word.unpack("c*").sort.pack("c*")
end
#signatures = Hash.new
#File.foreach(dictionary) do |line|
#	word = line.chomp
#	signature = signature_of(word)
#	(signatures[signature] ||= []) << word
#end
#ARGV.each do |word|
#	signature = signature_of(word)
#	if signatures[signature]
#		puts "Anagrams of #{word}: #{signatures[signature].join(', ')}"
#	else
#		puts "No anagrams of #{word} in #{dictionary}"
#	end
#end
