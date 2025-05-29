
# export JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on, -Dswing.aatext=true'

if [ -e /opt/java/java-home-symlink ]; then
    export JAVA_HOME=/opt/java/java-home-symlink
fi

if [ -e /usr/lib/jvm/default-runtime ]; then
    export JAVA_HOME=/usr/lib/jvm/default-runtime
fi
