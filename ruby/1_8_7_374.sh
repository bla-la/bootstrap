#!/bin/bash
BOOTSTRAP_RUBY_VER="v1_8_7_374"
RUBY_REPO="https://github.com/ruby/ruby.git"
BASE=$PWD

D=`dirname $0`
source "$D/../functions/common.sh"
TEMPORARY_DIRECTOR=`get_base_dir`
DST=`get_dst_dir`/ruby/$BOOTSTRAP_RUBY_VER

function make_bootstrap_ruby()
{
    cd $TEMPORARY_DIRECTOR/$BOOTSTRAP_RUBY_VER
    check_error "Change directory"

    echo "Cloning ruby reposytory.."
    echo "git clone $RUBY_REPO ./"
    git clone $RUBY_REPO ./
    check_error "Cloning ruby reposytory"
    
    echo "Checkout $BOOTSTRAP_RUBY_VER.."
    git checkout $BOOTSTRAP_RUBY_VER
    check_error "Checkout $BOOTSTRAP_RUBY_VER.."

    autoconf
    echo "DST $DST"
    ./configure --prefix=$DST
    check_error "Configure ruby"

    make
    check_error "Make ruby"

    make install
    check_error "Install ruby"


    echo "Ruby $BOOTSTRAP_RUBY_VER install complete"

}

if [ ! -z $RUBY_REPO_URL ]
then
    RUBY_REPO="$RUBY_REPO_URL"
fi

echo "Create temporary diractory $TEMPORARY_DIRECTOR"
make_directory $TEMPORARY_DIRECTOR
check_error "Create temporary directory"

rm -rf $TEMPORARY_DIRECTOR/$BOOTSTRAP_RUBY_VER
make_directory $TEMPORARY_DIRECTOR/$BOOTSTRAP_RUBY_VER
check_error "Create temporary directory"

make_bootstrap_ruby

