#!/bin/bash

set -e
cd

# Atualizando sistema

echo "Atualizando sistema"
if sudo apt update && \ sudo apt upgrade -y; then
    echo "Iniciando instalações"
else 
    read -r -p "Não foi possível atualizar, deseja continuar mesmo assim? (s/n): " resAtualiza
    case "$resAtualiza" in
        [nN])
        exit 0
        ;;
    esac
fi

echo "Instalando Curl" 
sudo apt install curl -y 

# Snap

echo "Instalando Snap"
sudo apt install snapd -y

# GDebi

echo "Instalando GDebi"
sudo apt install gdebi -y && \ sudo apt install gdebi-core gdebi-gtk -y

# Google Chrome

read -r -p "Deseja instalar o Google? (s/n): " resGoogle
case "$resGoogle" in
    [sSyY])
    echo "Instalando Google Chrome"

    wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    sudo gdebi -n ~/Downloads/google-chrome-stable_current_amd64.deb

    rm ~/Downloads/google-chrome-stable_current_amd64.deb
    ;;
esac

# Git

echo "Instalando Git"
sudo apt install git -y
sudo apt install -y curl git

read -r -p "Instalar Gerenciador de Credenciais para o Git? (s/n): " resGit
case "$resGit" in 
    [sSyY])
        curl -fsSL https://github.com/GitCredentialManager/git-credential-manager/releases/latest/download/gcm-linux_amd64.tar.gz | tar -xz
    sudo ./gcm-linux_amd64/install.sh

    git config --global credential.helper manager-core
    ;;
esac

# Node, Npm e NVM

echo "Instalando Node, Npm e NVM"
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - && \ sudo apt-get install -y nodejs

if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash; then
    export NVM_DIR="$HOME/.nvm"
    # shellcheck source=/dev/null
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    nvm install --lts
    nvm use --lts
else 
    echo "Não foi possível instalar o NVM"
fi

# Vscode 

echo "Instalando Vscode"
sudo apt install code -y

read -r -p "Instalar extensões padrões da FABRICA (s/n): " resFabrica
case "$resFabrica" in 
    [sSyY])
    code --install-extension ms-vscode.cmake-tools
    code --install-extension mikestead.dotenv
    code --install-extension bungcip.better-toml
    code --install-extension visualstudioexptteam.vscodeintellicode
    code --install-extension visualstudioexptteam.vscodeintellicode-api-usage-examples
    code --install-extension ritwickdey.LiveServer
    code --install-extension yzhang.markdown-all-in-one
    code --install-extension johnpapa.vscode-peacock
    code --install-extension esbenp.prettier-vscode
    code --install-extension ms-python.vscode-pylance
    code --install-extension ms-python.python
    code --install-extension ms-python.python-debugger
    code --install-extension charliermarsh.ruff
    code --install-extension alexcvzz.vscode-sqlite
    code --install-extension rangav.thunder-client
    code --install-extension wayou.vscode-todo-highlight
    code --install-extension vue.volar
    code --install-extension johnsoncodehk.volar-extension-pack
    code --install-extension dbaeumer.vscode-eslint
    ;;
esac

# Lista de extensões no formato: id|descrição amigável
extensoes=(
    "ms-vscode.cpptools|C/C++"
    "ms-vscode.cpptools-extension-pack|C/C++ Extension Pack"
    "ms-vscode.cpptools-themes|C/C++ Themes"
    "PKief.material-icon-theme|Material Icon Theme"
    "platformio.platformio-ide|PlatformIO IDE"
    "mads-hartmann.bash-ide-vscode|Bash IDE"
    "timonwong.shellcheck|ShellCheck"
)

echo ""
echo "Extensões do VSCode - Instalação opcional"
echo "-----------------------------------------"

for item in "${extensoes[@]}"; do
    id="${item%%|*}"
    nome="${item##*|}"
    
    read -r -p "Deseja instalar \"$nome\"? (s/n): " resMult
    if [[ "$resMult" =~ ^[sSyY]$ ]]; then
        code --install-extension "$id"
    else
        echo "Pulado: $nome"
    fi
done

echo ""
echo "Instalação de extensões finalizada."

# Python e PDM

echo "Instalando Python, Pip e PDM"
sudo apt install python3 && \ sudo apt install python-is-python3 && \ sudo apt install python3-pip

# Instalando PDM (Python Development Master)
curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 -
curl -sSL https://github.com/marrcandre/django-drf-tutorial/raw/main/scripts/pdm_config_bash.sh | bash

# MySql

read -r -p "Deseja instalar MySQL: (s/n): " resSql
case "$resSql" in 
    [sSyY])
    sudo apt install mysql-server
    sudo systemctl stop mysql
    sudo systemctl disable mysql

    read -r -p "Definir senha do root? (s/n): " resRoot
    case "$resRoot" in 
        [sSyY])
        sudo mysql_secure_installation
        ;;
    esac

    sudo apt install mysql-workbench
    ;;
esac

echo "Configurações do Arquivo Shell - Concluído"