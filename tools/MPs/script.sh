#!/bin/bash

#Iterate over all files
for file in * ; do
    name=$(echo "`cat "$file"`" | egrep "title.*Member of Parliament - Members of Parliament - House of Commons of Canada" | sed -r 's/.*title>(.*) - Member of.*/\1/' | grep -v \()
    email=$(echo "`cat "$file"`" | egrep "mailto:" | sed -r 's/.*mailto:(.*)".*/\1/' | grep -v \()
    phone=$(echo "`cat "$file"`" | egrep "Telephone" | head -2 | sed -r 's/.*Telephone: (.*)<.*/\1/' | grep -v \( | tail -1 )

    echo -e $name "|" $email "|" $phone
done

