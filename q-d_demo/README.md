function mvn_package(){
  git clone $1
  mv $2 $3/
  cd $3/$2
  mvn package
}
