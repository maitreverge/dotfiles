#!/bin/bash

# IMPORTANT: This script must be sourced, not executed:
#   source ./p_env.sh activate
#   or
#   . ./p_env.sh activate

# 🙏 Special thanks to DHRUV MAKWANA to making the base script 🙏
# You can find his original script at :
# https://makwanadhruv.medium.com/automating-virtual-environments-bash-script-magic-for-python-developers-3a06df1777a6

print_help() {
    echo -e "Usage: $0 \e[1;33m[option]\e[0m \e[1;32m[env_name]\e[0m\n"
	echo -e "Notes :\n1 - Your environment name \e[1;31mWILL\e[0m be named \e[1;32m.venv\e[0m if no \e[1;32m[env_name]\e[0m argument is provided."
	echo -e "2 - Your Python Packages files \e[1;31mMUST\e[0m be named \e[1;32mrequirements.txt\e[0m or \e[1;32msetup.py\e[0m, \nand both will be installed if both are present.\n"
    echo "Options:"
	echo -e "  \e[1;33mmaster\e[0m      Create, install and activate a new virtual environment "
    echo -e "  \e[1;33mcreate\e[0m      Create a new virtual environment"
    echo -e "  \e[1;33mactivate\e[0m    Activate the virtual environment"
    echo -e "  \e[1;33minstall\e[0m     Install dependencies from requirements.txt or setup.py"
    echo -e "  \e[1;33mexport\e[0m      Export installed dependencies to requirements.txt within a virtual environment (default name: .venv)"
    echo -e "  \e[1;33mremove\e[0m      Deactivate and remove the virtual environment"
}

check_virtualenv() {
    if ! command -v virtualenv &> /dev/null; then
        echo "virtualenv is not installed. Installing..."
        python3 -m pip install --user virtualenv
        echo "virtualenv installation complete."
    fi
}

create_venv() {

    # Check if virtualenv is installed, if not, install it
    check_virtualenv
    
    local env_name=${1:-".venv"}

    if [ -d "$env_name" ]; then
        echo "Virtual environment '$env_name' already exists. Aborting."
        return 1
    fi

	echo -e "\n \e[1;33m--  CREATING VIRTUAL ENVIRONMENT $env_name  --\e[0m 🔧\n"
	echo "------------------------------------------"

    python3 -m venv "$env_name"
    source "./$env_name/bin/activate"
    pip install -U pip

	echo "------------------------------------------"
	echo -e "\n \e[1;32m--  VIRTUAL ENVIRONMENT $env_name CREATED  --\e[0m ✅\n"
}

activate_venv() {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo "Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one."
        return 1
    fi

    source "./$env_name/bin/activate"

	echo -e "\n \e[1;32m--  VIRTUAL ENVIRONMENT $env_name ACTIVATED  --\e[0m ✅\n"
}

install_deps() {

    
	local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo "Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one."
        return 1
    fi

    source "./$env_name/bin/activate"

    if [ -f "requirements.txt" ]; then
		echo -e "\n \e[1;33m--  INSTALLING DEPENDENCIES FROM ./requirements.txt  --\e[0m 🔧\n"
		echo "------------------------------------------"

        pip install -r ./requirements.txt
		
		echo "------------------------------------------"
		echo -e "\n \e[1;32m--  DEPENDENCIES INSTALLED FROM ./requirements.txt --\e[0m ✅\n"
    fi

    if [ -f "setup.py" ]; then
		echo -e "\n \e[1;33m--  INSTALLING DEPENDENCIES FROM ./setup.py  --\e[0m 🔧\n"
		echo "------------------------------------------"

        pip install -e .
		
		echo "------------------------------------------"
		echo -e "\n \e[1;32m--  DEPENDENCIES INSTALLED FROM ./setup.py --\e[0m ✅\n"
    fi
}

export_deps() {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo "Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one."
        return 1
    fi

	echo -e "\n \e[1;33m--  EXPORTING DEPENDENCIES TO ./requirements.txt  --\e[0m 🔧\n"
	echo "------------------------------------------"

    source "./$env_name/bin/activate"
    pip freeze > requirements.txt
	echo "------------------------------------------"
	echo -e "\n \e[1;32m--  DEPENDENCIES EXPORTED TO ./requirements.txt  --\e[0m ✅\n"
}

remove_venv() {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo "Virtual environment '$env_name' not found."
        return 1
    fi

	echo -e "\n \e[1;33m--  REMOVING VIRTUAL ENVIRONMENT $env_name  --\e[0m 🔧\n"
	echo "------------------------------------------"
	# Only deactivate if there is a current active Virtual Environment
	if [ -n "$VIRTUAL_ENV" ]; then
		deactivate
	fi
    rm -rf "$env_name"

	echo "------------------------------------------"
	echo -e "\n \e[1;32m--  VIRTUAL ENVIRONMENT $env_name REMOVED  --\e[0m ✅\n"
}

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    print_help
    return 0
fi

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo -e "\e[1;31mERROR: This script must be sourced, not executed.\e[0m"
    echo -e "Please run: \e[1;32msource $0 [command]\e[0m or \e[1;32m. $0 [command]\e[0m"
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
        echo -e "\e[1;31mUnknown option: $1\e[0m"
        print_help
        exit 1
        ;;
esac
