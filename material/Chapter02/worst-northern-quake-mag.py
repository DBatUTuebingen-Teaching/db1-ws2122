# Magnitude of worst earthquake on the northern hemisphere

# Uses list-oriented style (based on list comprehension):
# any variable is assigned exactly once

from DB1 import Table

earthquakes = Table('earthquakes.csv')

magnitudes = [ float(quake['mag'])
                 for quake in earthquakes
                   if float(quake['latitude']) >= 0.0 ]

print(max(magnitudes))
