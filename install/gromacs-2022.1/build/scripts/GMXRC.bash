# sh/bash/zsh configuration file for Gromacs
# First we remove old gromacs stuff from the paths
# by selecting everything else.
# This is not 100% necessary, but very useful when we
# repeatedly switch between gmx versions in a shell.

#we make use of IFS, which needs shwordsplit in zsh
test -n "${ZSH_VERSION+set}" && setopt shwordsplit
old_IFS="$IFS"
IFS=":"

replace_in_path() {
  # Parse PATH-like variable $1, and return a copy of it with any instances of $3 removed and $2 added to the beginning.
  # If $3 is empty, do not remove anything.
  local tmppath oldpath to_remove to_add old_shell_opts
  oldpath="$1"
  to_add="$2"
  to_remove="$3"
  if test -z "${oldpath}"; then
    echo "${to_add}"
  else
    if test "${oldpath}" = ":"; then
      echo "${to_add}:"
    else
      tmppath="${to_add}"
      old_shell_opts="$-"
      set -o noglob
      set -- ${oldpath}"" # Will put tokens to $@, including empty ones
      # If did not have noglob ("f") enabled before, disable it back
      if test -n "${old_shell_opts##*f*}"; then
        set +o noglob
      fi
      for i in "$@"; do
        if test \( -z "${to_remove}" \) -o \( "$i" != "${to_remove}" \); then
          tmppath="${tmppath}:${i}"
        fi
      done
      echo "${tmppath}"
    fi
  fi
}

# Keep current values to remove later
OLD_GMXLDLIB="$GMXLDLIB"
OLD_GMXBIN="$GMXBIN"
OLD_GMXMAN="$GMXMAN"

##########################################################
# This is the real configuration part. We save the Gromacs
# things in separate vars, so we can remove them later.
# If you move gromacs, change the first line.
##########################################################
GMXPREFIX=/home/pamella/Documentos/softwares/gromacs-2022.1
GMXBIN=${GMXPREFIX}/bin
GMXLDLIB=${GMXPREFIX}/lib
GMXMAN=${GMXPREFIX}/share/man
GMXDATA=${GMXPREFIX}/share/gromacs
GMXTOOLCHAINDIR=${GMXPREFIX}/share/cmake
GROMACS_DIR=${GMXPREFIX}

LD_LIBRARY_PATH=$(replace_in_path "${LD_LIBRARY_PATH}" "${GMXLDLIB}" "${OLD_GMXLDLIB}")
PKG_CONFIG_PATH=$(replace_in_path "${PKG_CONFIG_PATH}" "${GMXLDLIB}/pkgconfig" "${OLD_GMXLDLIB}/pkgconfig")
PATH=$(replace_in_path "${PATH}" "${GMXBIN}" "${OLD_GMXBIN}")
# Ensure MANPATH always has a final :
if test -z "$MANPATH" ; then
   MANPATH=":"
fi
MANPATH=$(replace_in_path "${MANPATH}" "${GMXMAN}" "${OLD_GMXMAN}")

# export should be separate, so /bin/sh understands it
export GMXBIN GMXLDLIB GMXMAN GMXDATA LD_LIBRARY_PATH PATH MANPATH
export PKG_CONFIG_PATH GROMACS_DIR

IFS="$old_IFS"
unset old_IFS

# read bash completions if understand how to use them
# and this shell supports extended globbing
if test -n "${BASH_VERSION+set}" && (complete) > /dev/null 2>&1; then
  if (shopt -s extglob) > /dev/null 2>&1; then
    shopt -s extglob
    if [ -f $GMXBIN/gmx-completion.bash ]; then
      source $GMXBIN/gmx-completion.bash
      for cfile in $GMXBIN/gmx-completion-*.bash ; do
        source $cfile
      done
    fi
  fi
elif test -n "${ZSH_VERSION+set}" > /dev/null 2>&1 ; then
  autoload bashcompinit
  if (bashcompinit) > /dev/null 2>&1; then
    bashcompinit
    if [ -f $GMXBIN/gmx-completion.bash ]; then
      source $GMXBIN/gmx-completion.bash
      for cfile in $GMXBIN/gmx-completion-*.bash ; do
        source $cfile
      done
    fi
  fi
fi
