AutoMapperForRuby
=================

it is a mapper for mapping similar properties of two object of different types

#!/usr/local/bin/ruby -w

def mapper(source, destination)
  previous = ''
  src = []
  dest = []

    source.class.instance_methods.each do |t|
      if previous +'=' == t.to_s  then
      src.push(previous)
      end
    previous  = t.to_s
    end

   destination.class.instance_methods.each do |t|
      if previous +'=' == t.to_s then
      dest.push(previous)
      end
      previous  = t.to_s
   end

  final = src & dest
  final.pop

  final.each do |v|
  destination.instance_variable_set('@'+v,source.instance_variable_get('@'+v))
  end
return destination
end

class Person
   attr_accessor :name, :phone
 end
 
class Pen
   attr_accessor :name, :id
end

 
 rajan = Person.new
 rajan.name = 'rajan'
 rajan.phone = '000000000'
 
 camel = Pen.new
 
 camel = mapper(rajan,camel)
 puts camel.name
 