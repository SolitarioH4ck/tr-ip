#!/bin/bash
#Colores Utilizados
white='\033[1;37m'
red='\033[1;31m'

#Intalacion de paquetes necesarios
echo -e "$white[$red•$white]$red Actualizando paquetes...$white"
apt upgrade && apt upgrade
pkg install git
pkg install bash 
pkg install curl
pip install requests
pip install phonenumbers

#Menu de opciones
Menu(){
clear
echo -e "
$red.▄▄ ·       ▄▄▌  ▪  ▄▄▄▄▄ ▄▄▄· ▄▄▄  ▪
▐█ ▀. ▪     ██•  ██ •██  ▐█ ▀█ ▀▄ █·██ ▪
▄▀▀▀█▄ ▄█▀▄ ██▪  ▐█· ▐█.▪▄█▀▀█ ▐▀▀▄ ▐█· ▄█▀▄
$white▐█▄▪▐█▐█▌.▐▌▐█▌▐▌▐█▌ ▐█▌·▐█ ▪▐▌▐█•█▌▐█▌▐█▌.▐▌
 ▀▀▀▀  ▀█▄▀▪.▀▀▀ ▀▀▀ ▀▀▀  ▀  ▀ .▀  ▀▀▀▀ ▀█▄▀▪"
echo -e '                              \e[91m v.2.0'
echo -e "      \e[0m\e[41m created: by SolitarioH4ck23 \e[0m"
echo ""
echo -e "[\e[91m-$white] Herramienta de Geolocalización"
echo
echo -e "   [\e[91m1$white] Geolocalizar IP"
echo -e "   [\e[91m2$white] IPloggers"
echo -e "   [\e[91m3$white] Ver mi IP"
echo -e "   [\e[91m4$white] Send SMS anonimo"
echo -e "   [\e[91m5$white] Obtener info de un numero"
echo ""
echo -e "   [\e[91m00$white] Exit"
echo
echo -e -n $red">>" $white
read -r opcion


if [[ $opcion == 1 || $opcion == 01 ]];then

        clear
        echo -e "[\e[91m*$white] Inserta la IP:"
        echo -n ">> "
        read -r ip
        echo -e "$white[$red-$white]$red Buscando datos de:$white" $ip
        sleep 1.8
	if [[ $ip == "" ]];then
               date_ip
fi
date_ip(){
	ipfind=$(curl -s -L "http://ip-api.com/json/$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > infoip)
	query=$(grep -o '"query":.*' infoip | cut -d '"' -f4)
	echo
	if [[ $query == "" ]]; then
		echo -e "[\e[91m*$white] IP Address:$redUnknown"
	else
		echo -e "$white[$red*$white] IP Address:$red" $query
	fi


	country=$(grep -o '"country":.*' infoip | cut -d '"' -f4)

	if [[ $country == "" ]]; then
		echo -e "$white[$red*$white] Country:$red Unknown"
	else
		echo -e "$white[$red*$white] Country:$red" $country
	fi

	cc=$(grep -o '"countryCode":.*' infoip | cut -d '"' -f4)

	if [[ $cc == "" ]];then
		echo -e "$white[$red*$white] Country Code:$red Unknown"
	else
		echo -e "$white[$red*$white] Country Code:$red" $cc
	fi


	rn=$(grep -o '"regionName":.*' infoip | cut -d '"' -f4)
	if [[ $rn == "" ]];then
		echo -e "$white[$red*$white] Region:$red Unknown"

	else
		echo -e "$white[$red*$white] Region:$red" $rn
	fi

	city=$(grep -o '"city":.*' infoip | cut -d '"' -f4)
	if [[ $city == "" ]];then
		echo -e "$white[$red*$white] City:$red Unknown"
	else
		echo -e "$white[$red*$white] City:$red" $city
	fi

	zip=$(grep -o '"zip":.*' infoip | cut -d '"' -f4)
	if [[ $zip == "" ]];then
		echo -e "$white[$red*$white] zip:$red Unknown"
	else
		echo -e "$white[$red*$white] zip:$red" $zip
	fi

	tz=$(grep -o '"timezone":.*' infoip | cut -d '"' -f4)
	if [[ $tz == "" ]];then
		echo -e "$white[$red*$white] Time Zone:$red Unknown"
	else
		echo -e "$white[$red*$white] Time Zone:$red" $tz
	fi

	isp=$(grep -o '"isp".*' infoip | cut -d '"' -f4)
	if [[ $isp == "" ]];then

		echo -e "$white[$red*$white] ISP:$red Unknown"
	else
		echo -e "$white[$red*$white] ISP:$red" $isp

	fi

	org=$(grep -o '"org":.*' infoip | cut -d '"' -f4)
	if [[ $org == "" ]];then
		echo -e "$white[$red*$white] org:$red Unknown"
	else
		echo -e "$white[$red*$white] org:$red" $org
	fi

	as=$(grep -o '"as":.*' infoip | cut -d '"' -f4)
	if [[ $as == "" ]];then
		echo -e "$white[$red*$white] AS:$red Unknown"
	else
		echo -e "$white[$red*$white] AS:$red" $as
	fi

	lan=$(grep -o '"lat":.*' infoip | cut -d '"' -f3 | cut -d ':' -f2 | cut -d ',' -f1)
	lon=$(grep -o '"lon":.*' infoip | cut -d '"' -f3 | cut -d ':' -f2 | cut -d ',' -f1)

	if [[ $lan == "" || $lon == "" ]];then
		echo -e "$white[$red*$white] Google Maps:$red Unknown"
	else
		link_maps="https://www.google.com/maps/place/$lan,$lon"

		echo -e "$white[$red*$white] Google Maps:$red" $link_maps
	fi
	rm infoip
	echo
	echo -e "$white[\e[91m1$white] Regresar al Inicio"
	echo -e "$white[\e[91m2$white] Exit"

	echo ""
	read -p ">> " vh
	if [[ $vh == "1" || $vh == "1" ]];then
		Menu
	elif [[ $vh == "2" || $vh == "2" ]];then
		exit
	else
		echo -e "$white[$red!$white]$red Opción invalida"
		sleep 1
	fi
}
date_ip

elif [[ $opcion == 2 || $opcion == 02 ]];then
        echo ""
        termux-open https://iplogger.org/es/
        sleep 1.2
        Menu

elif [[ $opcion == 3 || $opcion == 03  ]];then
       echo -e $red"su dirección ip es:" $white
        curl ifconfig.me
        sleep 1.7
        Menu 

elif [[ $opcion == 4 || $opcion == 04 ]];then
        echo ""
        python sms.py

elif [[ $opcion == 5 || $opcion == 05 ]];then
        echo ""
        python number.py

elif [[ $opcion == 00 ]];then
	echo ""
	echo "Hasta la Proxima!"
	exit
else
	echo -e "[\e[91m!$white] Obcion Invalid!"
	sleep 1.2
	Menu


fi
}
Menu

