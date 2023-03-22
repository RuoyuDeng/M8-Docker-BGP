git submodule update --init --recursive

BASE=$(pwd)

# update LS
cd LobbyService
git branch
git checkout master
git pull

# update LS webui
cd src/main/resources/static
git branch
git checkout main
git pull

# update Splendor
cd $BASE
cd f2022-hexanome-08
git branch
git checkout splendor_M8_demo_v1
git pull

cd $BASE

