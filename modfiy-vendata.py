import csv
import json

with open('./SOURCE_DOCUMENTS/vendata.csv', newline='', encoding='utf-8') as csvfile:
    with open('natural_language.txt', 'w') as outfile:
        reader = csv.reader(csvfile)
        for row in reader:
            data = {
                'Numero Gaceta': row[1],
                'Fecha Gaceta': row[2],
                'Fecha Medida': row[3],
                'Tipo de Registro': row[4],
                'Funcionario': row[5],
                'Cargo': row[6],
                'Contenido': row[7],
                'Poder': row[8],
                'Ente': row[9],
                'Organo': row[10],
                'Niv.1': row[11],
                'Niv.2': row[12],
                'Niv.3': row[13]
            }
            json.dump(data, outfile)
            outfile.write('\n')