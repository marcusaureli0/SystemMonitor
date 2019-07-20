classdef PropertyManager  
    properties
        property
    end
    
    methods
      function obj = PropertyManager(path)
          reader = java.io.FileReader(path);
          obj.property = java.util.Properties();
          obj.property.load(reader);
      end
      
      function result = getProperty(obj, propertyName)
          result = char(obj.property.getProperty(propertyName));
      end
  end
end