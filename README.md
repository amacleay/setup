setup.git
=========
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/amacleay/setup.git
./setup/setup.sh   

# serve a simple site on port 8000
cd `mktemp -d`; echo '<!doctype html><html><head><title>Shabigail 2017</title></head><body><h2>Coming soon...</h2></body></html>' > index.html; python -m SimpleHTTPServer; cd -
```

See also http://github.com/startup-class/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.





