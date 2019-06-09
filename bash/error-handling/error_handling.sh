# This option will make the script exit when there is an error
set -o errexit
name=$1
# This option will make the script exit when it tries to use an unset variable
set -o nounset

main() {
  echo "Hello, "${name}""
}

main "$@"