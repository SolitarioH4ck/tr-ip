import phonenumbers
from phonenumbers import geocoder, carrier, timezone

#Colores
red = '\033[1;31m'
white = '\033[1;39m'

phone_number=   input(f'{white}[{red}-{white}] Ingresa el numero de telefono: {red}')
phone = phonenumbers.parse(phone_number)
international = phonenumbers.format_number(phone, phonenumbers.PhoneNumberFormat.INTERNATIONAL)
countrycode = international.split(' ')[0]
country = geocoder.country_name_for_number(phone, 'en')
location = geocoder.description_for_number(phone, 'en')
carrierr = carrier.name_for_number(phone, 'en')
print(f'{white}[{red}-{white}]{white} Formato internacional :{red} {international}')
print(f'{white}[{red}-{white}]{white} Nombre del país    : {red}{country} ({countrycode})')
print(f'{white}[{red}-{white}]{white} Ciudad / Provincia : {red}{location}')
print(f'{white}[{red}-{white}] {white}Operdador    : {red}{carrierr}')
for time in timezone.time_zones_for_number(phone):
    print(f'{white}[{red}-{white}] Zona horaria   : {red}{time}''\n')
    print(f'{white}[{red}-{white}] Escaneo completo..')
