alias vkbuild='docker build -t vk1 .'
alias vkrun='winpty docker run -v "$PWD":/app/source -it vk1'
alias vkup='docker-compose up'
