require 'aws-sdk'
require 'json'

serialized = File.read("tags.json")
tags = JSON.parse(serialized)

ec2 = Aws::EC2::Client.new(region: 'us-west-2')

reservations = ec2.describe_instances().reservations

match_instances = [];
reservations.each do |reservation|
	reservation.instances.each do |instance|
		match_instances.push(instance.instance_id)
		
	end
end
puts match_instances

ec2.create_tags(
  
  resources: match_instances,
  
  tags: [
    {
      key: "say",
      value: "hi",
    },
  ],
)
