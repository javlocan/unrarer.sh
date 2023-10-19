#!/bin/bash

# Serán utilizadas para reubicarnos
initialDir="./"
DIR=$initialDir

function deleteFiles(){
	read -p "¿Quieres borrar los archivos comprimidos? [y/n] " yesno
	case $yesno in 
		[yY])
			for file in *.rar; do 
				rm "$file"
			done
			echo "Ficheros borrados. Disfruta tus archivos! descomprimidos! :)"
			exit
			;;
		[Nn]) 
			echo "Perfect. Ok BAAAIIII."
			exit 
			;;
		*)
			echo "Leave it as it is. Ok BAAAIIII"
			exit
	esac


}

function handlePassword() {

	echo -e "Asegúrese de que todos los archivos comparten la misma contraseña."
	if [[ $1 ]]; then
		password=$1
	else 
		echo "¿Cual es la contraseña?"
		read -p "$ > " password 
	fi 
}

function checkPassword() {
	echo "Probando..."
		first=true
 	for file in *.rar;
 	do unrar e -o- "$file" -p$password -inul
		output=$?
		if [ $first = true ] ; then
			delete=$output
			case "$output" in 
				"11")
					echo "Contraseña incorrecta."
					;;
				"10")  
					echo "Éxito. Algunos archivos han sido sobreescritos"
					;;
				"0")
					echo "Éxito total."
					;;
				*) 
					echo "Error desconocido."
			esac
		fi
		first=false
	done

	if [ $delete != "11" ];then deleteFiles; fi 
}

function checkDir() {
	if [ -n $1 ]; then
		echo "Buscando en $DIR (contraseña introducida: $1)"
	else 
		echo "Buscando en $DIR"
	fi
	while ! find $DIR &>/dev/null ; do
		echo "El directorio no existe. Introduzca ruta del directorio: "
		read -e -p "$ > " -i "./" DIR
	done
	if [[ ! `find $DIR -maxdepth 1 -name "*.rar"` ]]; then
		echo "No hay ningún .rar en la carpeta. Introduce ruta del directorio:"
		read -p "$ > " DIR
		checkDir
	else 
		return 0
	fi
}


# ---------------------------------------------------
# ----------------- EL SCRIPT EN SÍ  ----------------
# ---------------------------------------------------

checkDir $1 && handlePassword $1 && checkPassword || echo 'ups' 


# echo "Estoy en "
# read -p "¿Están aquí los archivos para extraer? [y/n] " yesno	
# case $yesno in 
# 	[Yy])
# 	read -p "Genial ¿Cual es la contraseña? " password
# 	echo "Voy a intentarlo"
# 		for file in *.rar;
# 		do unrar e "$file" -ppassword;
# 		done
# 		exit
# 		;;	
# 	[Nn])
# 	echo "Porfi, ponme en la carpeta con los archivos a extraer"
# 	exit
# 	;;
# 	* ) "Andayaaa"
# 	exit
# 	
# esac
# done

