require 'aws-sdk'

def get_instances(region)
	ec2 = Aws::EC2::Client.new(region: region)
	reservations = ec2.describe_instances().reservations
	reservations.each do |reservation|
		reservation.instances.each do |instance|
			yield instance
		end
	end
end

def get_all_region_instances
	serialized = File.read("regions.json")
	regions = JSON.parse(serialized)
	regions.each do |region|
		get_instances(region) do |instance|
			yield instance
		end
	end
end

def get_all_running_all_region_instances
	get_all_region_instances do |instance|
		if instance.state.name != 'stopped'
			yield instance
		end
	end
end



