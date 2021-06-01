#!/bin/bash
echo "+-------------------------+"
echo "|Security Advisories Count|"
echo "+-------------------------+"
for i in Important Moderate Low
do
sec=$(yum updateinfo list security installed | grep $i | wc -l)
echo "$i: $sec"
done | column -t
echo "+-------------------------+"