module Slugable
  module ClassMethods
    def find_by_slug(sl)
      self.all.detect{ |instance| instance.slug == sl }
    end
  end

  module InstanceMethods
    def slug
      self.class.instance_methods.include?(:username) ? name_type = "username" : name_type = "name"
      self.send(name_type).downcase.gsub(" ", "-").delete("/\W/")
    end
  end
end