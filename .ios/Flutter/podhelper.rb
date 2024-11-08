# podhelper.rb for Flutter iOS integration

# Ensure this path points to your Flutter installation
flutter_application_path = File.expand_path('..', __dir__)

# Load Flutter tools for iOS
require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper.rb'), Dir.pwd)

# Function to install Flutter pods
def flutter_install_all_ios_pods(flutter_application_path)
  # Ensure Flutter engine is installed
  unless File.exist?(File.join(flutter_application_path, '.ios', 'Flutter', 'engine'))
    system("rsync -a --delete --exclude .symlinks --filter \":P .\" \"#{flutter_application_path}/ios/.symlinks\" \"#{flutter_application_path}/.ios\"")
  end

  # Install plugin pods
  install_flutter_plugin_pods(flutter_application_path)
  # Install engine pods
  install_flutter_engine_pod(flutter_application_path)
end
