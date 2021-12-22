#!/usr/bin/env bash
# shellcheck disable=SC2154

init_colors()
{
    for i in {0..7}; do
        printf -v "f[$i]" "%s" $'\e[3'"$i"'m'
    done
    reset=$'\e[0m'
}

print_box()
{
    local start_x="$1"
    local start_y="$2"
    local end_x="$3"
    local end_y="$4"

    if [[ "${end_x}" == *"+"* ]]; then
        local length_x="${end_x//'+'}"
    else
        local length_x="$((end_x - start_x))"
    fi

    if [[ "${end_y}" == *"+"* ]]; then
        local length_y="${end_y//'+'}"
    else
        local length_y="$((end_y - start_y))"
    fi

    local pat="$5"
    local i j

    ((length_x = length_x == 0 ? length_x + 1 : length_x))
    ((length_y = length_y == 0 ? length_y + 1 : length_y))

    ((start_x += ${x_offset:-0}))
    ((start_y += ${y_offset:-0}))

    printf "\\e[%d;%dH" "${start_y}" "${start_x}"

    for ((i = 0; i < length_y; i++)); do
        for ((j = 0; j < length_x; j++)); do
            printf "\\e[%d;%dH%s" "$((start_y + i))" "$((start_x + j))" "${pat}"
        done
    done
}

main()
{
    init_colors
    printf "%s" $'\e[2J'

    set1=(
        "${f[7]}" "${f[3]}"
        "${f[6]}" "${f[2]}"
        "${f[5]}" "${f[1]}"
        "${f[4]}"
    )

    set2=(
        "${f[4]}" "${f[0]}"
        "${f[5]}" "${f[0]}"
        "${f[6]}" "${f[0]}"
        "${f[7]}"
    )

    set3=(
        "${f[4]}" "${f[7]}"
        "${f[5]}"
    )

    for ((i = 0; i < ${#set1[@]}; i++)); do
        x_offset="$((2 + (i * 4)))"
        print_box "1" "1" "5" "9" "${set1[$i]}█"
    done

    for ((i = 0; i < ${#set2[@]}; i++)); do
        x_offset="$((2 + (i * 4)))"
        print_box "1" "9" "5" "10" "${set2[$i]}█"
    done

    for ((i = 0; i < ${#set3[@]}; i++)); do
        x_offset="$((2 + (i * 5)))"
        print_box "1" "10" "6" "12" "${set3[$i]}█"
    done

    x_offset="$((2 + (i * 5)))"
    print_box "1" "10" "14" "12" "${f[0]}█"

    printf "%s\\n\\n" "${reset}"
}

main
