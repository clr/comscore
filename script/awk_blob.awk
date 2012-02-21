#!/usr/bin/awk -f
BEGIN {
  FS="\t";
}
{
  print $1, $20;
}
