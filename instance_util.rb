require 'aws-sdk'

def instance_has_tags?(instance, tags)
	instance_tags = get_instance_tags(instance)
	instance_tags.merge(tags) == instance_tags

end

def get_instance_tags(instance)
	tags = {}
	instance.tags.each do |tag|
		tags[tag.key] = tag.value
	end
	tags
end