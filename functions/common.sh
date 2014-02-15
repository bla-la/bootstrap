DEFAULT_BUILD_DIR="/tmp/bootstrap"
DEFAULT_DST_DIR="/opt/dst"

function get_base_dir()
{
    if [ ! -z $BUILD_DIR ]
    then
        echo $BUILD_DIR
    else
        echo $DEFAULT_BUILD_DIR
    fi
}


function get_dst_dir()
{
    if [ ! -z $DST_DIR ]
    then
        echo $DST_DIR
    else
        echo $DEFAULT_DST_DIR
    fi
}

function error()
{
    echo "Error:$1 `basename $0`:$2"
    exit 1
}


function check_error()
{
    if [ 0 -ne $? ]
    then
        error "$1" "${BASH_LINENO}"
    fi
}

function make_directory()
{
    if [ ! -d $1 ]
    then
        mkdir $1
    fi
}
