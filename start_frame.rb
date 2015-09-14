#!/usr/bin/ruby

require 'net/http'
require 'json'

# Chromium command line options: http://peter.sh/experiments/chromium-command-line-switches/
system '/Applications/Chromium.app/Contents/MacOS/Chromium -kiosk /Users/brianburridge/Development/PhotoFrame/index.html &'


loop do
  # Once my Rails app is running, it will return JSON from a query showing the current photo
  # Eventually it will return the current schedule
  #uri = URI(QUERY_URL + "?title=#{URI.escape(movie_title)}")
  #raw_json = Net::HTTP.get(uri)

  json_raw = File.read('photos.json')
  photos = JSON.parse(json_raw)
  current_photo = photos['photo']

  puts "Setting current photo to #{current_photo}"

  system "ln -f -s #{current_photo} /Users/brianburridge/Development/PhotoFrame/current"
  sleep 60
end
