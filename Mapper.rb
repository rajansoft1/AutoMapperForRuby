#!/usr/local/bin/ruby -w

def mapper(source, destination)
  previous = ''
  src = []
  dest = []

    source.class.instance_methods(false).each do |t|
      if previous +'=' == t.to_s  then
      src.push(previous)
      end
    previous  = t.to_s
    end

   destination.class.instance_methods(false).each do |t|
      if previous +'=' == t.to_s then
      dest.push(previous)
      end
      previous  = t.to_s
   end

  final = src & dest
  final.each do |v|
  destination.instance_variable_set('@'+v,source.instance_variable_get('@'+v))
  end
return destination
end
