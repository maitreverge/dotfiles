#!/bin/bash

# IMPORTANT: This script must be sourced, not executed:
#   source ./p_env.sh activate
#   or
#   . ./p_env.sh activate

# 🙏 Special thanks to DHRUV MAKWANA to making the base script 🙏
# You can find his original script at :
# https://makwanadhruv.medium.com/automating-virtual-environments-bash-script-magic-for-python-developers-3a06df1777a6

RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
ESC="\e[0m"

print_help() {
    echo -e "\nUsage: $GREEN source$ESC $0 $YELLOW[option]$ESCAPE $BLUE[env_name]$ESC \n"
	echo -e "Notes :\n1 - Your environment name$RED WILL$ESC be named $GREEN .venv$ESC if no $BLUE[env_name]$ESC argument is provided."
	echo -e "2 - Your Python Packages files$RED MUST$ESC  be named $GREEN requirements.txt$ESC  or $GREEN setup.py$ESC , \nand both will be installed if both are present.\n"
    echo "Options:"
	echo -e "  $YELLOW master$ESC       Create, install and activate a new virtual environment "
    echo -e "  $YELLOW create$ESC       Create a new virtual environment"
    echo -e "  $YELLOW activate$ESC     Activate the virtual environment"
    echo -e "  $YELLOW install$ESC      Install dependencies from requirements.txt or setup.py"
    echo -e "  $YELLOW export$ESC       Export installed dependencies to requirements.txt within a virtual environment (default name: .venv)"
    echo -e "  $YELLOW remove$ESC       Deactivate and remove the virtual environment"
}

check_virtualenv() {
    if ! command -v virtualenv &> /dev/null; then
        echo -e "$YELLOW virtualenv is not installed. Installing...$ESC"
        python3 -m pip install --user virtualenv
        echo -e "$GREEN virtualenv installation complete.$ESC"
    fi
}

create_venv() {

    # Check if virtualenv is installed, if not, install it
    check_virtualenv
    
    local env_name=${1:-".venv"}

    if [ -d "$env_name" ]; then
        echo -e "$YELLOW Virtual environment '$env_name' already exists. Aborting.$ESC"
        return 1
    fi

	echo -e "\n $YELLOW --  CREATING VIRTUAL ENVIRONMENT $env_name  --$ESC  🔧\n"
	echo "------------------------------------------"

    python3 -m venv "$env_name"
    source "./$env_name/bin/activate"
    pip install -U pip

	echo "------------------------------------------"
	echo -e "\n $GREEN --  VIRTUAL ENVIRONMENT $env_name CREATED  --$ESC  ✅\n"
}

activate_venv() {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo -e "$RED Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one.$ESC"
        return 1
    fi

    source "./$env_name/bin/activate"

	echo -e "\n $GREEN --  VIRTUAL ENVIRONMENT $env_name ACTIVATED  --$ESC  ✅\n"
}

install_deps() {

	local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo -e "$RED Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one.$ESC"
        return 1
    fi

    source "./$env_name/bin/activate"

    if [ -f "requirements.txt" ]; then
		echo -e "\n$YELLOW --  INSTALLING DEPENDENCIES FROM ./requirements.txt  --$ESC  🔧\n"
		echo "------------------------------------------"

        pip install -r ./requirements.txt
		
		echo "------------------------------------------"
		echo -e "\n$GREEN --  DEPENDENCIES INSTALLED FROM ./requirements.txt --$ESC  ✅\n"
    fi

    if [ -f "setup.py" ]; then
		echo -e "\n$YELLOW --  INSTALLING DEPENDENCIES FROM ./setup.py  --$ESC  🔧\n"
		echo "------------------------------------------"

        pip install -e .
		
		echo "------------------------------------------"
		echo -e "\n$GREEN --  DEPENDENCIES INSTALLED FROM ./setup.py --$ESC  ✅\n"
    fi
}

export_deps() {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo -e "$RED Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one.$ESC"
        return 1
    fi

	echo -e "\n$YELLOW --  EXPORTING DEPENDENCIES TO ./requirements.txt  --$ESC  🔧\n"
	echo "------------------------------------------"

    source "./$env_name/bin/activate"
    pip freeze > requirements.txt
	echo "------------------------------------------"
	echo -e "\n$GREEN --  DEPENDENCIES EXPORTED TO ./requirements.txt  --$ESC  ✅\n"
}

remove_venv() {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo "Virtual environment '$env_name' not found."
        return 1
    fi

	echo -e "\n $YELLOW --  REMOVING VIRTUAL ENVIRONMENT $env_name  --$ESC  🔧\n"
	echo "------------------------------------------"
	# Only deactivate if there is a current active Virtual Environment
	if [ -n "$VIRTUAL_ENV" ]; then
		deactivate
	fi
    rm -rf "$env_name"

	echo "------------------------------------------"
	echo -e "\n $GREEN --  VIRTUAL ENVIRONMENT $env_name REMOVED  --$ESC  ✅\n"
}

# Calls help printing
if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ] ; then
    print_help
    exit 1
fi

# Stops execution is the first argument is the script name
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo -e "$RED ERROR: This script must be sourced, not executed.$ESC "
    echo -e "Example:$BLUE source$ESC $GREEN$0$ESC $YELLOW master$ESC\n\n"
    echo -e "Please run: $YELLOW$0$ESC $GREEN-h $ESC <or $GREEN--help$ESC or$GREEN help $ESC> for script usage. "
	# print_help
    exit 1
fi

case "$1" in
    "master")
        create_venv "$2"
        install_deps "$2"
        activate_venv "$2"
        ;;
    "create")
        create_venv "$2"
        ;;
    "activate")
        activate_venv "$2"
        ;;
    "install")
        install_deps "$2"
        ;;
    "export")
        export_deps "$2"
        ;;
    "remove")
        remove_venv "$2"
        ;;
    *)
        echo -e "$RED Unknown option: $1$ESC "
        print_help
        exit 1
        ;;
esac
