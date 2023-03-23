#Modulos
import pyshorteners,time
from os import system
#by: SolitarioH4ck23

#Colores
red = '\033[1;31m'
white = '\033[1;39m'

system("clear")
print('')
url = input(f"{red}Ingresa la url >> {white}")
shrt = pyshorteners.Shortener()                     
nurl = shrt.tinyurl.short(url)
print('')
time.sleep(1.2)
print(f"{red}URL Acortada:{white}",nurl)
