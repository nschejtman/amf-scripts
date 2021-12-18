#!/bin/zsh

function find() {
    declare -l kind=$1
    declare dir=$2
    case $kind in
        "raml10" )
            files_containing "#%RAML 1.0 *$" $dir ;;
        "raml08" )
            files_containing "#%RAML 0.8 *$" $dir ;;
        "oas20" )
            files_containing '"\?swagger"\?: *"\?2.0"\?' $dir ;;
        "oas30" )
            files_containing '"\?openapi"\?: *"\?3.0\(\.0\)\?"\?' $dir ;;
        "oas301" )
            files_containing '"\?openapi"\?: *"\?3.0.1"\?' $dir ;;
        "oas302" )
            files_containing '"\?openapi"\?: *"\?3.0.2"\?' $dir ;;
        "oas303" )
            files_containing '"\?openapi"\?: *"\?3.0.3"\?' $dir ;;
        "async20" )
            files_containing '"\?asyncapi"\?: *"\?2.0\(\.0\)\?"\?' $dir ;;
        "dialect10"
            files_containing '#%Dialect 1.0 *$' $dir ;;
        "vocabulary10"
            files_containing '#%Vocabulary 1.0 *$' $dir ;;
        * )
            echo "Unrecognized kind '$kind'"
            echo "Valid values are 'raml10', 'raml08', 'oas20', 'oas30', 'oas301', 'oas302', 'oas303', 'async20', 'dialect10', 'vocabulary10'" ;;
    esac
}

function files_containing() {
    declare regex=$1
    declare dir=$2
    grep -rwsI "$dir" -e "$regex" | cut -d ':' -f1
}

find $@