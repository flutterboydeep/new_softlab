# This is the PodHelper file used for CocoaPods integration with Flutter.

def parse_KV_file(file, separator='=')
    if !File.exists? file
        return [];
    end
    generated = [];
    File.foreach(file) do |line|
        key, value = line.strip.split(separator, 2)
        if (key && value)
            generated.push([key, value])
        end
    end
    return generated;
end

def flutter_root
    generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __dir__)
    unless File.exist?(generated_xcode_build_settings_path)
        raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter pub get is executed first."
    end
    File.foreach(generated_xcode_build_settings_path) do |line|
        matches = line.match(/FLUTTER_ROOT\=(.*)/)
        return matches[1].strip if matches
    end
    raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try deleting #{generated_xcode_build_settings_path} and running flutter pub get again."
end

def flutter_ios_podfile_setup
    # Add any setup code here, if needed.
end

def install_flutter_engine_pod
    engine_dir = File.expand_path(File.join(flutter_root, 'bin', 'cache', 'artifacts', 'engine'))
    framework_dir = File.expand_path('ios', engine_dir)

    unless File.exist?(framework_dir)
        raise "#{framework_dir} must exist. If you're running pod install manually, make sure flutter pub get is executed first."
    end

    pod 'Flutter', :path => File.join(framework_dir, 'Flutter.xcframework')
end

def install_flutter_plugin_pods
    flutter_application_path = File.expand_path(File.join('..', '..'))
    eval(File.read(File.join(flutter_application_path, '.flutter-plugins-dependencies')), binding, File.join(flutter_application_path, '.flutter-plugins-dependencies'))
end
