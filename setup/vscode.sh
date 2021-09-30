#!/usr/bin/env bash

# Applies VSCode settings & installs extensions

cp .vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
cp .vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

code --install-extension bradlc.vscode-tailwindcss
code --install-extension bung87.rails
code --install-extension bung87.vscode-gemfile
code --install-extension Cardinal90.multi-cursor-case-preserve
code --install-extension cpylua.language-postcss
code --install-extension cssho.vscode-svgviewer
code --install-extension dbaeumer.vscode-eslint
code --install-extension DigitalBrainstem.javascript-ejs-support
code --install-extension donjayamanne.githistory
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension formulahendry.auto-rename-tag
code --install-extension GitLab.gitlab-workflow
code --install-extension GraphQL.vscode-graphql
code --install-extension Gruntfuggly.todo-tree
code --install-extension hashicorp.terraform
code --install-extension mrorz.language-gettext
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension panicbit.cargo
code --install-extension rust-lang.rust
code --install-extension sianglim.slim
code --install-extension silvenon.mdx
code --install-extension slevesque.vscode-hexdump
code --install-extension vadimcn.vscode-lldb
code --install-extension waderyan.gitblame
code --install-extension wix.vscode-import-cost
code --install-extension yzhang.markdown-all-in-one
