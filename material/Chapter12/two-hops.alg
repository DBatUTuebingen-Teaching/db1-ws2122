-- Build adjacency relation

G = {from:string, to:string
     A, B
     B, A
     B, C
     A, D
    }

-- Compute the paths of length two

ρ to←to2 π from,to2
  (σ to=from2
    (G ⨯ ρ from2←from, to2←to (G)))
