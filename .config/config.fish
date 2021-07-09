export PATH="$HOME/.cargo/bin:$PATH"
set -g fish_user_paths "/usr/local/opt/openjdk@11/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openjdk@11/bin" $fish_user_paths

set --export LIBRARY_PATH $LIBRARY_PATH:/usr/local/lib/
set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;
set -gx PATH $ANDROID_HOME/emulator $PATH

set --export JAVA_HOME /Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home;
set -gx PATH $JAVA_HOME/bin $PATH;

set -g fish_user_paths "/usr/local/opt/jpeg-turbo/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
# status --is-interactive; and source (rbenv init -|psub)
# set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
# set -gx LDFLAGS "-L/usr/local/opt/bzip2/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/bzip2/include"
# fish_add_path /usr/local/opt/bzip2/bin
