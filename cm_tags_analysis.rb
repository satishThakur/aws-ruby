require_relative 'find_instances_with_tags'

puts "Number of instances with tags : {system: canvas,canvas : yes}"

instance_with_system_canvas_tags = find_instance_with_tags({'system' => 'canvas', 'canvas' => 'yes'})

puts instance_with_system_canvas_tags.size.to_s



puts "Number of instances with tag : {canvas: yes}"
instances_with_canvas_tag = find_instance_with_tags({'canvas' => 'yes'})
puts instances_with_canvas_tag.size.to_s

puts "Number of instances with tag : {system: canvas}"
instances_with_system_tag = find_instance_with_tags({'system' => 'canvas'})
puts instances_with_system_tag.size.to_s


puts "====Instances with system=canvas but no canvas=yes tags ========="

diff = instances_with_system_tag - instance_with_system_canvas_tags

diff.each do |instance|
	puts instance.instance_id.to_s + ' ' + instance.public_dns_name.to_s + ' ' + instance.private_dns_name + ' ' + instance.state.name
end
