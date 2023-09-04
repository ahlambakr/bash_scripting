#!/bin/bash
data_base="./my_database"

create_database (){
echo "enter the database name "
read db_name
sudo mkdir -p "$data_base/$db_name"
echo "databse $db_name created "

}

list_database (){
echo "list databse"
ls "$data_base"

}

connect_database (){
echo "what is the database you wanna to connect to"
        read db_name
        if [ -d "$data_base/$db_name" ];then
               cd "$data_base/$db_name"
# Debugging: Display variable values
    #echo "db_name: $db_name"
#echo $(pwd)
               database_menu
               cd ..


                              else
        echo "Database '$db_name' does not exist."
    fi
}


drop_database (){
        echo "what the database name you wanna to drop"
read db_name
if [ -d "$data_base/$db_name" ]; then
        sudo rm -rf "$data_base/$db_name"
        echo "database $db_name dropped "

else
echo "database $db_name does not exist "
fi
}

database_menu (){

select  var in "create table" "list tables" "Drop tables" "insert into tables" "press 5 to exit"
do
        case $var in
                                "create table" )
                        create_table ;;
                "list tables")
                  list_tables ;;



 "Drop tables")
                  Drop_tables;;
          "insert into tables")
                  insert_into_tables;;

        "press 5 to exit")
        exit

esac
done


}

create_table(){
echo "enter the table name"
        read table_name
 # Debugging: Display variable values
    #echo "db_name: $db_name"
    #echo "table_name: $table_name"
                                       sudo touch "$table_name"


#              declare -A column_data_types

 # while true; do
  #          echo "Enter column name (or 'done' to finish): "
   #         read column_name
    #        if [ "$column_name" == "done" ]; then
   break
      #      fi

       #     echo "Enter the column datatype: "
        #    read column_type
         #   column_data_types["$column_name"]="$column_type"
        #done




        }



list_tables (){

echo "list tables"


#echo $(pwd)
ls .

}

Drop_tables(){
echo "what is tabel name you wanna to drop "
        read table_name
        if [ -f "$table_name" ]; then
sudo rm "$table_name"
echo "table dropped"
else
        echo "tables does not exist "
        fi

}

insert_into_tables (){

#echo $(pwd)
echo "enter the tabel you want to insert in"
read tabel_name

 declare -A column_data_types  # Associative array to store column data types

        # Prompt for column names and data types
        while true; do
            read -p "Enter column name (or 'done' to finish): " col_name
            if [ "$col_name" == "done" ]; then


   break
            fi
            read -p "Enter data type for column '$col_name': " col_data_type
            column_data_types["$col_name"]=$col_data_type
        done



}

#update_tabels(){
 # Create the table file
      #  touch "$DATA_DIR/$current_db/$table_name.csv"
 #sudo touch "$data_base/$db_name/$table_name.csv"
        # Store column data types in a file (e.g., metadata.txt)
  #      for col_name in "${!column_data_types[@]}"; do
   #         echo "$col_name:${column_data_types[$col_name]}" >> "$data_base/$db_name/$table_name.metadata"
    #    done

     #   echo "Table '$table_name.csv' created in database '$current_db'."


#}

select var in "create database" "list database" "connect to database" "drop database" "press 5 to exit "
do
case $var in



"create database" )
#echo "creating database";;
create_database;;

"list database" )
list_database;;

"connect to database" )
        connect_database;;
"drop database")
drop_database;;
"press 5 to exit")
exit

esac
done
