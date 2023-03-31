import requests, time, os
#code by: SolitarioH4ck23

#Colores..
red = '\033[1;31m'
white = '\033[1;39m'
azul = '\033[1;34m'

numero = input(f"{white}[{red}-{white}]{white}Numero de la victima: {red}")
print(f'{white}Escribe el Mensaje')

sms =input(f">> {red}")

resp = requests.post('https://textbelt.com/text', {
   'phone': f'{numero}',
    'message': f'{sms}',
    'key': 'textbelt',
      })
print(f'{white}Enviado SMS👻...')
time.sleep(1.5)
print('')
input(f'{white}[{red}-{white}] SMS Enviado Presiona enter🤡...')
os.system("bash tr.sh")
