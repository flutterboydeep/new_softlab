# podhelper.rb file for integrating Flutter dependencies into iOS via CocoaPods
unless File.exist?(File.expand_path('../flutter_export_environment.sh', __dir__))
    raise 'The Flutter podhelper script requires the flutter_export_environment.sh script. ' \
          'Make sure your Flutter project is properly configured.'
  end
  
  require File.expand_path('../flutter_export_environment.sh', __dir__)
  
  def flutter_install_all_ios_pods(flutter_application_path)
    flutter_root = File.expand_path('..', flutter_application_path)
    load File.join(flutter_root, '.ios', 'Flutter', 'podhelper.rb')
  end
  