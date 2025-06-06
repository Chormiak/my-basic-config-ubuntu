# EM FASE DE TESTES, RECOMENDADO NÃO USAR ATÉ QUE ESSA MENSAGEM SUMA

# Configurações Básicas do Ubuntu

---

## Atualização do Sistema

```bash
sudo apt update && sudo apt upgrade
sudo apt install curl
```

---

## Instalando GDebi

```bash
sudo apt install gdebi
sudo apt install gdebi-core
```

---

## Snap

```bash
sudo apt install snapd
```

---

## Instalando Google Chrome

```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo gdebi google-chrome-stable_current_amd64.deb
# ou, se preferir:
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y
rm -r google-chrome-stable_current_amd64.deb
```

---

## Instalando Git e Gerenciador de Credenciais

```bash
sudo apt install git
sudo apt install -y curl git

# baixar gerenciador de credenciais
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
rm -r gcm-linux_amd64.2.6.1.deb

git-credential-manager configure # configurar crendenciais
```

---

## Node.js, npm e NVM

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# Após abrir um novo terminal:
nvm install --lts
nvm use --lts
```

---

## Instalando Visual Studio Code (VSCode)

```bash
sudo snap install code --classic
```

### Extensões recomendadas para VSCode

```bash
# code --install-extension ms-vscode.cpptools
# code --install-extension ms-vscode.cpptools-extension-pack
# code --install-extension ms-vscode.cpptools-themes
# code --install-extension platformio.platformio-ide
# code --install-extension PKief.material-icon-theme
# code --install-extension Bash IDE
# code --install-extension ShellCheck
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
```

### Configuração recomendada no VSCode

* Habilitar **Word Wrap**
* Desativar **Compact Folders**

---

## Python e PDM

```bash
sudo apt install python3
sudo apt install python-is-python3
sudo apt install python3-pip
sudo apt install python3-venv

# Instalando PDM (Python Development Master)
curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 -

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

curl -sSL https://github.com/marrcandre/django-drf-tutorial/raw/main/scripts/pdm_config_bash.sh | bash
```

---

## MySQL

```bash
sudo apt install mysql-server
sudo systemctl stop mysql
sudo systemctl disable mysql
sudo mysql_secure_installation
```

---

## MySQL Workbench

```bash
sudo snap install mysql-workbench-community
```

---

## Extension Manager

```bash
sudo apt install gnome-shell-extension-manager
```