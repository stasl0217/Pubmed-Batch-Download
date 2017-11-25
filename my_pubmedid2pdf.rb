#!/usr/bin/env ruby 

# == Shirley
#  	Change: read PMID from file

# == Synopsis 
#   This program tries to download a PDF file for the given comma-separated pubmed IDs
#
# == Required GEMS
#     mechanize (0.9.3)
#     socksify (1.1.0) (if you plan on using SOCKS)
#
# == Usage 
#    ruby pubmedid2pdf.rb
#
# == Author
#   Bio-geeks (adapted a script by Edoardo "Dado" Marcora, Ph.D.)
#   <http://bio-geeks.com>
#
# == Copyright
#   Copyright (c) 2009 Bio-geeks. Licensed under the MIT License:
#   http://www.opensource.org/licenses/mit-license.php
#
# == Copyright
#   Copyright (c) 2015 Bill Greenwald. Licensed under the MIT License:
#   http://www.opensource.org/licenses/mit-license.php

require 'optparse'
require 'rubygems'
require_relative './pdfetch.rb'

#pmid = 19508715
#pubmeds = ARGV[0]
# CHANGED BY SHIRLEY, read pubmeds from file
pubmeds_array=[]
File.open("list.txt", "r") do |f|
  f.each_line do |line|
    # puts line
	pubmeds_array << line  # append to array
  end
end
# CHANGE END


# pubmeds_array = pubmeds.split(",")
 server = ARGV[1]
 port = ARGV[2]

fetcher = Fetch.new()

if (!server.nil? && !port.nil?)
  fetcher.useSocks(server,port)
end

pubmeds_array.each do |p|
  warn "Trying to fetch #{p}"   
  fetcher.get(p.rstrip)
end
