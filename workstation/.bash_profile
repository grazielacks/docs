# Aliases
alias ls="ls -G"
alias r="rails"

# Metodos
# EACH - Metodo para executar algum comando para todas as pastas. Ex.: each git pull
each () {
 for f in `ls`; do
   echo "--> $f"
   cd $f
   $*
   cd ..
 done
}
