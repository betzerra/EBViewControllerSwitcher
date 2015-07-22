Pod::Spec.new do |s|
  s.name             = "EBViewControllerSwitcher"
  s.version          = "0.1.0"
  s.summary          = "ViewController that allows replace its child with custom transitions"
  s.description      = <<-DESC
                       Sometimes you need to transition between viewControllers without pushing or presenting a modal.
You just need to dissapear the whole screen and replace it with another one. I don't always need to do that, but when I do, I use EBViewControllerSwitcher :-) 
                       DESC
  s.homepage         = "https://github.com/betzerra/EBViewControllerSwitcher"
  s.license          = 'MIT'
  s.author           = { "Ezequiel Becerra" => "ezequiel.becerra@gmail.com" }
  s.source           = { :git => "https://github.com/betzerra/EBViewControllerSwitcher.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/betzerra'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'EBViewControllerSwitcher' => ['Pod/Assets/*.png']
  }

end
