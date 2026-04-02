#!/usr/bin/env bash

# Author: omitida
# Date: 02/04/2026
# Description: Bash Script that write bash scripts

# Help function to display
function help {
  file="$0"

  echo "${file} -[options] [filename]"

  echo "Options Avaliable:"
  echo "-d:	Delete a bash file."
  echo "-g:	Create a generic bash script."
  echo "-r:	Run a bash script."
  echo "-h:	Display this help message."

  exit 0
}

# global variables
filename=

# check the extension of the file
# if the file does not have a .sh extension, add it
function check_file_extension {
    filename="${1}"
    file_extension="${filename##*.}"
    new_file="${filename%.*}.sh"
    [[ "${file_extension}" != "sh" ]] && filename="${new_file}"
}

function check_file_exists {
    filename="${1}"
    [[ -e "${filename}" ]] && filename="${filename%.*}_$(date +'%H%M%S').sh"
}

# function to create a generic bash script
function create_generic_script {
  local filename="$1"
  check_file_extension "${filename}"
  check_file_exists "${filename}"
  echo "#!/usr/bin/env bash" > "${filename}"
  echo "" >> "${filename}"
  echo "# Author: omitida" >> "${filename}"
  echo "# Date: $(date +'%d/%m/%Y')" >> "${filename}"
  echo "# Description: " >> "${filename}"
  echo "" >> "${filename}"
  echo "" >> "${filename}"
}


[[ "$#" -ne 2 ]] && { help ; exit 1; }

# options string
options="d:g:r:h"

# Parse options
while getopts "${options}" opt; do
  case ${opt} in
    d)
      echo "Deleting bash script: ${OPTARG}"
      rm -f "${OPTARG}"
      ;;
    g)
      echo "Creating generic bash script: ${OPTARG}"
      create_generic_script "${OPTARG}"
      ;;
    h)
      help
      ;;
    r)
        echo "Running bash script: ${OPTARG}"
        chmod +x "${OPTARG}"
        ./${OPTARG}
        ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      help
      ;;
    *)
      echo "Unknown option: -${OPTARG}" >&2
      help
      ;;
  esac
done
