Pod::Spec.new do |s|
  s.name              = "Pipe"
  s.version           = "0.1.0"
  s.summary           = "Simple Pipe operator for Swift"
  s.description       = <<-DESC
  
  Defines |> pipe operator as seen in Elixir and F#. Includes
  curried versions of map, filter and reduce.

                       DESC
  s.homepage          = "https://github.com/danthorpe/Pipe"
  s.license           = 'MIT'
  s.author            = { "Daniel Thorpe" => "@danthorpe" }
  s.source            = { :git => "https://github.com/danthorpe/Pipe.git", :tag => s.version.to_s }
  s.module_name       = 'Pipe'
  s.social_media_url  = 'https://twitter.com/danthorpe'
  s.requires_arc      = true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.default_subspec   = 'Common' 

  s.subspec 'Common' do |ss|
    ss.source_files   = 'Source/Pipe.swift'    
  end
end

