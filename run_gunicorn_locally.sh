#!/bin/bash
#
# For this to work:
# NEED TO INSTALL gunicorn IN THE VIRTUALENV:
#   pipenv install gunicorn

PROJ_DIR=$(pwd)

VENV_LS=$(ls -d /home/art/.virtualenv/DFB_01*)
echo "VENV_LS is ${VENV_LS}"

###VENV_DIR="/home/art/.virtualenv/${VENV_LS}"
VENV_DIR="${VENV_LS}"

if [ ! -d $VENV_DIR ] ; then
	echo '*ERROR* No virtualenv dir ' $VENV_DIR
	exit 9
else
	echo '  Found virtualenv dir: ' $VENV_DIR
fi

export PYTHONPATH="${PROJ_DIR}/my_test_project:${VENV_DIR}/lib/python3.6/site-packages"

echo "PYTHONPATH is ${PYTHONPATH}"

# add the hellodjango project path into the sys.path
#sys.path.append('<PATH_TO_MY_DJANGO_PROJECT>/hellodjango')

# add the virtualenv site-packages path to the sys.path
#sys.path.append('<PATH_TO_VIRTUALENV>/Lib/site-packages')

#export DJANGO_SETTINGS_MODULE="my_test_project.settings"
#gunicorn my_test_project/my_test_project.wsgi


gunicorn --env DJANGO_SETTINGS_MODULE=my_test_project.settings my_test_project.wsgi

### end ###
