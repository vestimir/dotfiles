np() {
    if [[ "$1" != "." ]]; then
        mkdir $1
        cd $1
    fi

    git init
    touch README.md
    touch .gitignore

    echo '.DS_Store' > .gitignore
}
