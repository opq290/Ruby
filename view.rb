# an object structure vizualizer
#
# usage
# > load("./view.rb")
# > p=Point.new(0,1)    # assume that Point is defined
# > view(p)             # will show a structure of p
# > q=Point.new(2,3)
# > view(q)             # shows structures of p and q
# > no_view(p)          # no longer shows p, but q
# > clear()             # close the viewer, and forget everything
# > view(p)             # shows only p

require("tempfile")
require("timeout")

module ObjectViewer
  @@DotPathInMacOSX = "/Applications/Graphviz.app/Contents/MacOS/Graphviz"
  @@DotCommandX11 = "dot -Txlib"

  if File.exist?(@@DotPathInMacOSX)
    @@dot_command = @@DotPathInMacOSX
  else
    @@dot_command = @@DotCommandX11
  end

  class Rb2dot
    attr_accessor("in_view", "names", "counter", "primitive", "buffer",
                  "visited", "file", "pid", "view_counter")


    
    def initialize()
      self.in_view = []
      self.names = {}
      self.counter = 0
      self.primitive = nil
      self.visited = {}
      self.file = nil
      self.pid = nil
      self.view_counter=0
    end
    
    def out(l)
      buffer.push(l)
    end
    
    def close_previous_viewer()
      while self.pid                  # Process.kill sometimes fails to kill a
        begin                         # process.  In such a case, the subsequent
          timeout(1) {                # Process.wait stops forever.  We 
            Process.kill(15,self.pid) # therefore use timeout to stop waiting
            Process.wait(self.pid)    # no longer than one second, but calls
            self.pid = nil            # Process.kill again.
          }
        rescue TimeoutError => e
        end
      end
      if self.file
        #self.file.close(true)
        if File.exist?(self.file.path)
          File.delete(self.file.path) # delete the file
        end
        self.file = nil
      end
    end

    def tempfile(base)          # The Graphviz on Mac OS X can only take
      f = Tempfile.new(base)    # input files with an extension ".dot".
      f_ext = open(f.path()+".dot", "w") # We use Tempfile#new to get a 
      f.close(true)                      # unqiue path, but immediately
      f_ext                              # deletes the created file.
    end
    
    def flush()
      close_previous_viewer()
      self.file = tempfile("view")
      for i in 0..self.buffer.length()-1
        self.file.puts(self.buffer[i])
      end
      self.file.close()
      if defined? _tr
        system("dot -Tps #{self.file.path()}"+
               " > #{$tr_base_file_name}-#{self.view_counter+=1}.eps")
      else
        self.pid = fork { exec("#{@@dot_command} #{self.file.path()}") }
      end
    end
    
    def view(obj)
#      if !self.in_view.include?(obj)
#        self.in_view.push(obj)
#      end
      self.in_view = []
      self.in_view.push(obj)
      draw_graph()
      obj
    end

    def no_view(obj)
      self.in_view.delete(obj)
      draw_graph()
    end

    def clear()
      self.in_view = []
      close_previous_viewer()
    end

    def draw_graph()
      self.buffer=[]
      self.visited={}
      out("digraph G {")
      out("  rankdir=LR")
      self.in_view.each{ |obj| traverse(obj) }
      out("}")
      flush()
    end
    
    def primitive_class?(clazz)
      [Fixnum,NilClass,FalseClass,TrueClass,String].member?(clazz)
    end
    
    def user_class?(clazz)
      ![Hash].member?(clazz)
    end
    
    def traverse(obj)
      if user_class?(obj.class) && !self.visited[obj]
        self.visited[obj]=true
        children = getfields(obj)
        children.each {|key,val|
          key=key.to_s.sub("@","") # remove @ from a field name
          out("  \"#{getname(obj)}\" -> \"#{getname(val)}\" [label=\"#{key}\"]")
          flushprimitive()
          traverse(val)
        }
      end
    end
    
    def flushprimitive()
      if self.primitive
        out(self.primitive)
        self.primitive = nil
      end
    end
    
    def primitive_to_label(primitive)
      s = primitive.inspect.gsub(/([\\"])/, "\\\\\\1")
#      if primitive.kind_of?(String)
#        "\\\""+s+"\\\""
#      else
#        s
#      end
      s
    end

    def getname(obj)
      if primitive_class?(obj.class)
        name="p#{self.counter}"
        self.primitive = "  \"p#{self.counter}\" "+
          "[label=\"#{primitive_to_label(obj)}\", shape=plaintext"+
          (obj.kind_of?(String) ? ", fontname=\"Courier\"" : "") +
          "]"
        self.counter = self.counter + 1
        name
      elsif name=self.names[obj]
        name
      else
        newname=obj.class.to_s()
        count=0
        while self.names.has_value?(newname)
          count=count+1
          newname=obj.class.to_s() + count.to_s()
        end
        self.names[obj]=newname
        newname
      end
    end
    
    def getfields(obj)
      fields={}
      values = obj.instance_variables().each{|name| 
	fields[name] = obj.instance_variable_get(name)
      }
      fields
    end
  end #class R2dot

  Viewer=Rb2dot.new if !const_defined?("Viewer") # create a singleton
                                                 # viewer object

  def view(obj)
    Viewer.view(obj)
  end

  def no_view(obj)
    Viewer.no_view(obj)
  end

  def clear()
    Viewer.clear()
  end

  module_function("view", "no_view", "clear") # export this function

end #module ObjectViewer

include(ObjectViewer)           # import the exported functions

#$Id: view.rb,v 1.9 2009/12/26 05:39:04 masuhara Exp $

# version 1.9
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
