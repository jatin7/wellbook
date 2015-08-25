function mvn_package(){
  git clone $1
  mv $2 $3/
  cd $3/$2
  mvn package
}

#Download and build necessary Hive SerDes
mkdir ~/wellbook/serdes
mvn_package https://github.com/ogrodnek/csv-serde csv-serde ~/wellbook/serdes

cd ~/
#Sets up HDFS folder structure
sh ~/wellbook/q-d_demo/hdfs_setup.sh
#Sets up Hive tables
sh ~/wellbook/q-d_demo/hive_setup.sh
