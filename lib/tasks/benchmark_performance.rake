task benchmark_performance: :environment do

  Grandparent.delete_all
  Parent.delete_all
  Child.delete_all

  grandparent = Grandparent.create
  200.times do |i|
    parent = Parent.create(grandparent_id: grandparent.id)
    20.times{ Child.create(parent_id: parent.id) }
  end

  loaded_grandparent = Grandparent.includes(parents: :children).where(id: grandparent.id).first
  puts "loaded"

  result = Benchmark.measure do
    loaded_grandparent.parents.each do |parent|
      parent.children
    end
  end

  puts result

end
