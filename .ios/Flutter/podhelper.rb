require 'json'

def parse_KV_file(file, separator='=')
  file_abs_path = File.expand_path(file)
  return {} unless File.exist? file_abs_path
  File.foreach(file_abs_path).map { |line| line.strip.split(separator, 2) }.reject { |key, value| key.nil? || value.nil? }.to_h
end

def flutter_root
  generated_xcode_build_settings = parse_KV_file(File.join(File.expand_path('..', __dir__), 'Generated.xcconfig'))
  generated_xcode_build_settings['FLUTTER_ROOT'] || File.expand_path('..', __dir__)
end

def flutter_podspec
  File.expand_path(File.join('..', 'Flutter', 'flutter_export_environment.sh'), __dir__)
end

def flutter_install_all_ios_pods(flutter_application_path)
  pod 'Flutter', :path => File.expand_path(File.join(flutter_application_path, '.ios', 'Flutter'))
end
