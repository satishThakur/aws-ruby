require 'aws-sdk'
require 'json'
require_relative 'ec2'
require_relative 'instance_util'


def find_instance_from_tag
	serialized = File.read("tags.json")
	tags = JSON.parse(serialized)
	match_instances = []
	get_all_running_all_region_instances do |instance|
		if instance_has_tags?(instance,tags)
			match_instances.push(instance)
		end
		match_instances
	end
end


def find_instance_with_tags(tags)
	match_instances = []
	get_all_running_all_region_instances do |instance|
		if instance_has_tags?(instance,tags)
			match_instances.push(instance)
		end
	end
	match_instances
end




