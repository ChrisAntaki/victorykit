alias vkbuild='docker build -t vk1 .'
alias vkrun='winpty docker run -v "$PWD":/app -it vk1 bash'
