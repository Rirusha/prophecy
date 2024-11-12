vapi_sources = files(
  'config.vapi',
)

vala_code_sources = files (
  'about.vala',
  'application.vala',
  'fortune-label.vala',
  'main-window.vala',
  'main.vala',
)

sources = [
  vapi_sources,
  vala_code_sources,
  resources
]

executable (
  meson.project_name(),
  sources,
  include_directories: config_h_dir,
  dependencies: dependencies,
  install: true,
)
