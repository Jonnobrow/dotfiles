#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

for f in pluginrc.zsh
do
    cp $CDIR/$f $build_dir/
done

urls = (
    "https://github.com/sharkdp/fd/releases/download/v8.3.2/fd-v8.3.2-x86_64-unknown-linux-musl.tar.gz"
    "https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz"
    "https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-musl-v0.10.1.zip"
    "https://github.com/sharkdp/bat/releases/download/v0.20.0/bat-v0.20.0-x86_64-unknown-linux-musl.tar.gz"
)

for plugin in ${plugins[*]}
do
    portable_url="$plugin"
    tarname=`basename $portable_url`
    foldername="${tarname/.tar.gz/}"
    bin_name=$(echo $foldername | cut -f 1 -d-)

    cd $build_dir

    [ $QUIET ] && arg_q='-q' || arg_q=''
    [ $QUIET ] && arg_s='-s' || arg_s=''
    [ $QUIET ] && arg_progress='' || arg_progress='--show-progress'

    if [ -x "$(command -v wget)" ]; then
        wget $arg_q $arg_progress $portable_url -O $tarname
    elif [ -x "$(command -v curl)" ]; then
        curl $arg_s -L $portable_url -o $tarname
    else
        echo Install wget or curl
    fi

    tar -xzf $tarname
    rm $tarname
    mv $foldername $bin_name
done
