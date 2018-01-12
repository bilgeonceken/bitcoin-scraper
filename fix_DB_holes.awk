#!/bin/awk -f
BEGIN{
  OFS=" "
  first_line = 1
}
{
  unixtime = $1
  closeval = $5
  if (first_line) {
    first_line = 0
  }
  else {
    while(unixtime - lastunixtime > 60) {
      lastunixtime = lastunixtime + 60
      print lastunixtime, lastcloseval, lastcloseval, lastcloseval, lastcloseval, 0, 0, 0
    }
  }
  print $0
  lastunixtime = unixtime
  lastcloseval = closeval
}
