class grahamconfig::params {
  # $::luser and $::boxen_srcdir come from Boxen's custom facts
  $my_username  = 'grahamgilbert'
  $my_homedir   = "/Users/${my_username}"
  $my_sourcedir = "${my_homedir}/src"
}
