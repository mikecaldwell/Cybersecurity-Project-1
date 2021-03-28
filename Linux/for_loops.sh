#!/bin/bash

mystates=('Texas' 'California' 'Nevada' 'Hawaii' 'Washigton')

for st in ${mystates[@]};
do
  if [ $st == 'Hawaii' ]
  then
    echo "Hawaii is the best!"
  else
    echo "I'm not a fan of Hawaii."
  fi
done




