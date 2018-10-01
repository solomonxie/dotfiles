# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#


do_install_jekyll_manually(){
    echo "========== (Installing Ruby & essentials) ==========="
    sudo apt-get install ruby ruby-dev build-essential
    echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
    echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
    echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc


    echo "========== (updating gem) ==========="
    gem sources --add http://gems.github.com 
    gem sources --remove https://rubygems.org/
    gem sources --update
    yes | sudo gem update --system

    echo "========== (Installing Jekyll/Bundler) ==========="
    sudo gem install jekyll
    sudo gem install bundler

    echo "========== (Installing npm/gulp) ==========="
}


do_install_jekyll_docker(){
    echo ""
}

do_install_jekyll_manually