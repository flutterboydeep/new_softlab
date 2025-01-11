# podhelper.rb file for integrating Flutter dependencies into iOS via CocoaPods
unless File.exist?(File.expand_path('../flutter_export_environment.sh', __dir__))
    raise 'The Flutter podhelper script requires the flutter_export_environment.sh script. Make sure your Flutter project is properly configured.'
  end
  
  # Load Flutter environment variables
  require File.expand_path('../flutter_export_environment.sh', __dir__)
  
  def flutter_install_all_ios_pods(flutter_application_path)
    flutter_root = File.expand_path('..', flutter_application_path)
    flutter_ios_engine = File.expand_path('bin/cache/artifacts/engine/ios', flutter_root)
    pod 'Flutter', :path => File.join(flutter_application_path, '.symlinks', 'flutter', 'ios')
  
    # Add more Flutter dependencies if necessary
    if File.exist?(File.join(flutter_application_path, '.symlinks', 'flutter', 'ios', 'plugin_pods.rb'))
      load File.join(flutter_application_path, '.symlinks', 'flutter', 'ios', 'plugin_pods.rb')
    end
  end
  