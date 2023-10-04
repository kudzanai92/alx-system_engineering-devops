#!/usr/bin/env ruby

# Define a method to extract sender, receiver, and flags from a log entry
def extract_info(log_entry)
  sender = log_entry.match(/\[from:(.*?)\]/)[1]
  receiver = log_entry.match(/\[to:(.*?)\]/)[1]
  flags = log_entry.match(/\[flags:(.*?)\]/)[1]
  "#{sender},#{receiver},#{flags}"
end
# Check if an argument is provided
if ARGV.empty?
  puts "Usage: ./100-textme.rb <log_entry>"
  exit(1)
end
# Process the provided log entry
log_entry = ARGV[0]
info = extract_info(log_entry)

# Check if the info is empty and handle accordingly
if info.empty?
  puts "Error: Unable to extract information from the log entry."
  exit(1)
else
  puts info
end
