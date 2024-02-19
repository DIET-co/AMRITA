#!/bin/bash

# Function to multiply two matrices
multiply_matrices() {
    local matrix1=("$@")
    local matrix2=("${!#}")
    local result=()

    # Check if matrices are compatible for multiplication
    if [ "${#matrix1[@]}" -eq "${#matrix2[0]}" ]; then
        local rows="${#matrix1[@]}"
        local cols="${#matrix2[0]}"
        local common="${#matrix1[0]}"

        for ((i = 0; i < rows; i++)); do
            for ((j = 0; j < cols; j++)); do
                local sum=0
                for ((k = 0; k < common; k++)); do
                    local element1="${matrix1[i * common + k]}"
                    local element2="${matrix2[k * cols + j]}"
                    sum=$((sum + element1 * element2))
                done
                result+=("$sum")
            done
        done

        # Print the result matrix
        for ((i = 0; i < rows; i++)); do
            for ((j = 0; j < cols; j++)); do
                echo -n "${result[i * cols + j]} "
            done
            echo
        done
    else
        echo "Matrices are not compatible for multiplication."
    fi
}

# Example matrices
matrix1=(2 3 4 5 6 7)
matrix2=(1 0 2 3 1 4)

# Call the function to multiply matrices
multiply_matrices "${matrix1[@]}" "${matrix2[@]}"
