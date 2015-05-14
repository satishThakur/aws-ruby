require 'aws-sdk'
require_relative 'ec2'

get_all_region_instances do |instance|
	puts 'Public ip' + ': ' + instance.public_ip_address.to_s
	puts '=========TAGS=========='
	instance.tags.each do |tag|
		puts tag.key + ': ' + tag.value
	end
end