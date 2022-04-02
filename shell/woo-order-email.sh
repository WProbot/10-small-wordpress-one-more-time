#!/bin/bash

#
# woo-order-email.sh
#

  wp db dump - --tables=$(wp db prefix)postmeta   \
               --skip-extended-insert             |  gawk '

    /ing_email/ {
      gsub(".[)];.*$", "");
      gsub("^.*_email...", "");
      if($1) {
        print $0;
      }
    }

  ' | sort -u > woo-order-email.txt

#-#
