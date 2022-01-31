# -*- coding: utf-8 -*

# Demonstrate the use of non-monotonic algebraic operators

# RA query:
# "Find those LEGO sets in which all bricks are yellow."

from DB1 import *

# relevant LEGO database tables (NB: small variants)

sets = Table('sets-small.csv')
contains = Table('contains-small.csv')
colors = Table('colors.csv')


# RA query (plan as discussed in lecture)

# q = project(['set','name','img'],
#       natjoin(
#         sets,
#         difference(
#           project(['set'], sets),
#           project(['set'],
#             select(lambda t:t['name'] != 'Yellow',
#               project(['set','color','name'],
#                 natjoin(contains, colors)))))))


# Optimized RA query
#
#            π[set,name,img]
#            |
#            ⋈
#           /  \
#        sets   -
#             /   \
#        π[set]    π[set]
#          |       |
#      contains    ⋈[color ≠ yellow]
#                 /  \ ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ 1 tuple only
#          contains   π[yellow←color]
#                     |
#                     σ[name = 'Yellow']
#                     |
#                   colors
#
# runs in about 2s

q = project(['set','name','img'],
      natjoin(
        sets,
        difference(
          project(['set'], contains),
          project(['set'],
            join(lambda t:t['color'] != t['yellow'],
              contains,
              project(lambda t:{'yellow':t['color']},
                select(lambda t:t['name'] == 'Yellow', colors)))))))


# print output

for row in q:
  print(row)
