sgp() {
    export GOPATH="$(pwd)"
    export PATH=$PATH:$GOPATH/bin
    print "Your GOPATH is now: '$fg[green]$GOPATH$reset_color'"
}

phpid() {
    id="$(php -r 'echo uniqid();')"
    echo $id
    echo -n $id | xclip -selection clipboard
}

uid() {
    id="$(uuid)"
    echo $id
    echo -n $id | xclip -selection clipboard
}
