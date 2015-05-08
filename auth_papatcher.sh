#!/bin/bash

# Provide credentials to papatcher
# Enter your pa credentials below
PA_USER="pauser_to_replace"
PA_PASSWORD="papassword_to_replace"

(echo "$PA_USER"; sleep 1s; echo $PA_PASSWORD) |  go run papatcher.go

echo "Do not care of previous error message !"
exit 0
