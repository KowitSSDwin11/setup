# b4

sudo -s

cd
```
nano ~/.profile

# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

source ~/.profile 
```
```
nano ~/.bashrc

ccache -M 50G

source ~/.bashrc
source ~/.profile
```

# titan

###  for los
```
cd

wget https://raw.githubusercontent.com/rushiranpise/titan/main/los.sh

bash los.sh
```
## for pe
```
cd

wget https://raw.githubusercontent.com/rushiranpise/titan/main/pe.sh

bash pe.sh
```
