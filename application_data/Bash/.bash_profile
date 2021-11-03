######################### 别名 #########################

# 文件管理
alias ll="ls -al"
alias lh="ls -alh"
alias mk="mkdir"
alias rr="rm -rf"

# git
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"

# docker
alias dk="docker"
alias dc="docker-compose"

# python
alias py="python"

######################### 函数 #########################

# docker 
function dcstart(){
    echo "input container name:"
    read CONTAINER_NAME
    docker start ${CONTAINER_NAME}
    docker attach ${CONTAINER_NAME}
}

# python
function pyinstall_clean(){
    rm -rf __pycache__/
    rm -rf build/
    rm -f *.spec
}

source ~/.bash_env