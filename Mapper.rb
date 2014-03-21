#!/usr/local/bin/ruby -w

def domain_to_domain_map(source, destination)
      src = []
      dest = []

      src = get_members(source)
      dest = get_members(destination)

      final = src & dest

      final.each do |val|
        destination.instance_variable_set('@'+val,source.instance_variable_get('@'+val))
      end

      return destination
    end

    def model_to_view_model_mapping(model, view_model)
          source =  model.attribute_names
         destination = get_members(view_model)
          final = source & destination

          final.each do |val|
            view_model.instance_variable_set('@'+val,model[val])
          end

          return view_model
    end

    def view_model_mapping_to_model(view_model, model)
      source =  get_members(view_model)
      destination = model.attribute_names
      final = source & destination

      final.each do |val|
        model[val] = view_model.instance_variable_get('@'+val)
      end

      return model
    end

    # return the array of all properties of class
    def get_members(source)
      attributes = []
      previous =''
      source.class.instance_methods(false).each do |t|
        if previous +'=' == t.to_s  then
          attributes.push(previous)
        end
        previous  = t.to_s
      end
      return attributes
    end


    def model_to_domain_map(source, destination)

    end

    def domain_to_model_map(source, destination)

    end