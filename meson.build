project(
  'prophecy',
  ['vala', 'c'],
  version: '3.1.8',
  meson_version: '>=1.5.1',
  license: 'GPL-3.0-or-later',
)

gnome = import('gnome')
i18n = import('i18n')

glib2_dep = dependency('glib-2.0', version: '>=2.82.0')
gtk4_dep = dependency('gtk4', version: '>=4.16.1')
libadwaita_dep = dependency('libadwaita-1', version: '>=1.6.0')

dependencies = [
  glib2_dep,
  gtk4_dep,
  libadwaita_dep
]

add_project_arguments(
  '-include', 'config.h',
  language: ['c']
)

add_project_arguments(
  '--target-glib', '2.76',
  '--vapidir', meson.current_source_dir(),
  language: ['vala']
)

app_id = 'space.rirusha.prophecy'

conf = configuration_data()
conf.set_quoted('APP_ID', app_id)
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('G_LOG_DOMAIN', meson.project_name())
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf.set_quoted('DATADIR', get_option('prefix') / get_option('datadir'))
conf.set_quoted('GNOMELOCALEDIR', get_option('prefix') / get_option('localedir'))

configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

subdir ('po')
subdir ('data')
subdir ('src')

gnome.post_install(
  glib_compile_schemas: true,
  gtk_update_icon_cache: true,
  update_desktop_database: true,
)
