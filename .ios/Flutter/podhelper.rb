# Define helper methods to integrate Flutter dependencies into your iOS project

def parse_KV_file(file, separator='=')
    file_abs_path = File.expand_path(file)
    if !File.exists? file_abs_path
      return [];
    end
    # Return key-value results parsed from the file
    File.foreach(file_abs_path).map { |line| line.split(separator, 2).map(&:strip) }
  end
  
  def flutter_root
    generated_xcode_build_settings_path = File.expand_path(File.join('..', '..', 'Flutter', 'Generated.xcconfig'), __FILE__)
    unless File.exist?(generated_xcode_build_settings_path)
      raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter build ios is run first"
    end
  
    File.foreach(generated_xcode_build_settings_path) do |line|
      matches = line.match(/FLUTTER_ROOT\=(.*)/)
      return matches[1].strip if matches
    end
    raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try building the app first."
  end
  
  # Install Flutter engine and plugin pods
  def flutter_install_all_ios_pods(flutter_application_path)
    unless File.exist?(File.join(flutter_application_path, '.ios', 'Flutter', 'engine'))
      system("rsync -a --delete --exclude .symlinks --filter \":P .\" \"#{flutter_application_path}/ios/.symlinks\" \"#{flutter_application_path}/.ios\"")
    end
  
    install_flutter_plugin_pods(flutter_application_path)
    install_flutter_engine_pod(flutter_application_path)
  end
  