require 'aws-sdk'
require 'json'

serialized = File.read("tags.json")
tags = JSON.parse(serialized)

ec2 = Aws::EC2::Client.new(region: 'us-west-2')

reservations = ec2.describe_instances().reservations

match_instances = [];
reservations.each do |reservation|
	reservation.instances.each do |instance|
		tags_temp = tags.clone
		instance.tags.each do |tag|
			if tags_temp.has_key?(tag.key) && tags_temp[tag.key] == tag.value
				tags_temp.delete(tag.key)
			end
			
		end
		if(tags_temp.empty?)
			match_instances.push(instance)
		end
		
	end
end

match_instances.each do |instance|
	puts 'Public ip' + ': ' + instance.public_ip_address
end
if match_instances.empty?
	puts 'NO MATCH FOR TAGS:' + tags.to_s
end