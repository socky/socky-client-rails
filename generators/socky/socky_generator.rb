class SockyGenerator < Rails::Generator::Base
  
  def manifest # this method is default entrance of generator
    record do |m|
      m.directory File.join('lib', 'tasks')
      m.template 'socky.rake', File.join('lib', 'tasks', 'socky.rake')
    end
  end
  
end