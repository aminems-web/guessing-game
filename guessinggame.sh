#!/usr/bin/env bash

count_files() {
    local file
    file_count=0

    # Include hidden files and skip directories.
    for file in ./* ./.[!.]* ./..?*
    do
        if [ -f "$file" ]; then
            file_count=$((file_count + 1))
        fi
    done
}

count_files
printf 'How many files are in the current directory?\n'

while true
do
    printf 'Enter your guess: '
    if ! IFS= read -r guess; then
        exit 1
    fi

    case "$guess" in
        ''|*[!0-9]*)
            printf 'Please enter a non-negative whole number.\n'
            continue
            ;;
    esac

    while [ "$guess" != 0 ] && [ "${guess#0}" != "$guess" ]; do
        guess=${guess#0}
    done

    if [ "$guess" = "$file_count" ]; then
        printf 'Congratulations! You guessed correctly.\n'
        break
    elif [ "${#guess}" -gt "${#file_count}" ] || [ "$guess" -gt "$file_count" ]; then
        printf 'Too high. Try again.\n'
    else
        printf 'Too low. Try again.\n'
    fi
done
