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

# function to create a generic bash script
function create_generic_script {
  local filename="$1"
  check_file_extension "${filename}"
  echo "#!/usr/bin/env bash" > "${filename}"
  echo "" >> "${filename}"
  echo "# Author: omitida" >> "${filename}"
  echo "# Date: $(date +'%d/%m/%Y')" >> "${filename}"
  echo "# Description: " >> "${filename}"
  echo "" >> "${filename}"
  echo "" >> "${filename}"
}


if [[ "$#" -ne 2 ]]; then
  help
  exit 1
fi

# options string
options="d:g:h"

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
      exit 0
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      help
      exit 1
      ;;
    *)
      echo "Unknown option: -${OPTARG}" >&2
      help
      exit 1
      ;;
  esac
done
