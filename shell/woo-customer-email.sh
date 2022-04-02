#!/bin/bash

#
# woo-customer-email.sh
#

  wp user list | gawk '

    BEGIN {
      FS = OFS = "\t";
    }

    $6 ~ /customer/ {
      print $4, $3;
    }

  ' | sort -u > woo-customer-email.txt

#-#
