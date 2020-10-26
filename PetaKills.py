import requests
from bs4 import BeautifulSoup
import time

titles = ['Año:',
          'Recividos:',
          'Transferidos:',
          'Adoptados:',
          'Porcentaje de adoptados:',
          'Muertes:',
          'Porcentaje de muertes:']
page = requests.get("https://petakillsanimals.com/proof-peta-kills/#why-peta-kills")

if page.status_code == 200:
    print('El Departamento de Agricultura y Servicios al Consumidor de Virginia (VDACS) requiere que todos\n'
          'los refugios de animales informen la cantidad de gatos y perros que aceptan cada año. Los registros\n'
          'indican cuántos gatos y perros fueron recuperados por sus dueños, adoptados, transferidos a otras agencias\n'
          'de liberación de Virginia (es decir, refugios y control de animales), transferidos a agencias\n'
          'de liberación fuera del estado, que murieron por causas naturales o sacrificados y cuántos mantenía vivo\n'
          'el refugio al final del año. Este script automatiza la busqueda de la tabla de datos a partir de mitades\n'
          ' del año de 1998 a travez de la pagina "petakills.com"')
    time.sleep(10)

    soup = BeautifulSoup(page.content, "html.parser")
    tr = soup.table.find_all('tr')

    for row in tr:
        cols = row.find_all('td')
        counter = 0
        for ele in cols:
            if ele.text.strip() != 'Total':
                print(titles[counter], ele.text.strip())
            else:
                print(ele.text.strip())
            counter += 1
        print('\n')
