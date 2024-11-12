desktop_file = i18n.merge_file(
  input: app_id + '.desktop.in',
  output: app_id + '.desktop',
  po_dir: '../po',
  type: 'desktop',
  install: true,
  install_dir: join_paths(get_option('datadir'), 'applications')
)

# Validate Desktop
desktop_utils = find_program('desktop-file-validate', required: false)
if desktop_utils.found()
  test('validate-desktop', desktop_utils,
    args: [desktop_file]
  )
endif

metainfo_file = i18n.merge_file(
  input: app_id + '.metainfo.xml.in',
  output: app_id + '.metainfo.xml',
  po_dir: '../po',
  type: 'xml',
  install: true,
  install_dir: join_paths(get_option('datadir'), 'metainfo')
)

# Validate Appdata
appstreamcli = find_program('appstreamcli', required: false)
if (appstreamcli.found())
  test('validate-appdata',
    appstreamcli,
    args: ['validate', metainfo_file],
    workdir: meson.current_build_dir()
  )
endif

blueprints = custom_target(
  'blueprints',
  input: files(
    'ui/fortune-label.blp',
    'ui/window.blp',
  ),
  output: '.',
  command: [
    find_program('blueprint-compiler'),
    'batch-compile',
    '@OUTPUT@',
    '@CURRENT_SOURCE_DIR@',
    '@INPUT@',
  ],
)

resource_files = files(app_id + '.gresource.xml')
resources = gnome.compile_resources('prophecy-resources', resource_files, dependencies: blueprints, c_name: 'prophecy')

subdir('icons')
