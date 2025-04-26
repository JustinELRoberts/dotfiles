#!/bin/bash

# Abstracting the logic to print a line the entire width of the console
function print_fullwidth_line {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

# Macos is stuck on bash major version 3, which doesn't support associative arrays.
# Rather than require installing another version of bash to run this, I will use
# two arrays to store the results: one for keys and one for values
scripts_invoked=()
script_results=()

# `0` if all installations succeed; `1` otherwise
return_code=0

for install_script in */install.sh; do
  # Print a full-width line to separate each script invocation
  print_fullwidth_line

  # Run the script, storing and logging the result
  scripts_invoked+=("$(dirname $install_script)")
  echo "Running $install_script..."
  echo ""
  sh $install_script
  result=$?
  if [ $result -eq 0 ]; then
    echo ""
    echo "Execution successful"
    script_results+=("Installed")
  else
    echo ""
    echo "Execution failed with code $result"
    script_results+=("Failed")
    return_code=1
  fi

  for x in "${!script_return_code_map[@]}"; do printf "[%s]=%s\n" "$x" "${script_return_code_map[$x]}" ; done

  # Print a full-width line to separate each script invocation
  print_fullwidth_line
done

# Print a summary of the results
print_fullwidth_line
echo "Summary:"
for (( i=0; i<${#scripts_invoked[@]}; i++ )) do
  printf "%10s: %s\n" ${scripts_invoked[i]} ${script_results[i]}
done
print_fullwidth_line

exit "$return_code"

