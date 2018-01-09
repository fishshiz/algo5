require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
    sorted = []
    top = Queue.new
    vertices.each do |vertex|
        if vertex.in_edges.empty?
            top.enq(vertex)
        end
    end

    until top.empty?
        current = top.pop
        sorted << current
        current.out_edges.each do |edge|
            if edge.to_vertex.in_edges.length == 1
                top.enq(edge.to_vertex)
            end
            edge.dup.destroy!
        end
    current.dup.destroy!
    end

 return sorted if sorted.length == vertices.length
 []
end
