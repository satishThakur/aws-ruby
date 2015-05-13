require 'aws-sdk'

ec2 = Aws::EC2::Client.new(region: 'us-west-2')

reservations = ec2.describe_instances().reservations


reservations.each do |reservation|
	reservation.instances.each do |instance|
		puts 'Public ip' + ': ' + instance.public_ip_address
		puts '=========TAGS=========='
		instance.tags.each do |tag|
			puts tag.key + ': ' + tag.value
		end
	end
end