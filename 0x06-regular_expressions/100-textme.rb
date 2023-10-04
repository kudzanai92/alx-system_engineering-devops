#!/usr/bin/env ruby

# Define a method to extract sender, receiver, and flags from a log entry
def extract_info(log_entry)
  sender = log_entry.match(/\[from:(.*?)\]/)[1]
  receiver = log_entry.match(/\[to:(.*?)\]/)[1]
  flags = log_entry.match(/\[flags:(.*?)\]/)[1]
  "#{sender},#{receiver},#{flags}"
end

# Read the log file and process each log entry
log_file = ARGV[0]

if log_file.nil?
  puts "Usage: ./100-textme.rb <log_file>"
  exit(1)
end

begin
  File.readlines(log_file).each do |line|
    if line.include?('Receive SMS') || line.include?('Sent SMS')
      info = extract_info(line)
      puts info
    end
  end
rescue StandardError => e
  puts "Error: #{e.message}"
  exit(1)
end
