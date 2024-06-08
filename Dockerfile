# Use the official Node.js image as a base
FROM node:18

# Install dependencies
RUN apt-get update && apt-get install -y curl

# install oh my zsh
RUN apt-get install -y zsh

# create user student
RUN useradd -ms /bin/zsh student

USER student

# Set the working directory
WORKDIR /home/student
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Set up environment variables for Bun
ENV PATH="/home/student/.bun/bin:$PATH"


# Verify Bun installation
RUN bun --version


# set zsh as default shell
# SHELL ["/bin/zsh", "-c"]

# Set the command to be run when the container starts
# CMD ["sleep", "infinity"]
CMD while sleep 120 && ps aux | egrep 'vscode.*[b]ootstrap-fork.*extensionHost.*' > /dev/null; do :; done