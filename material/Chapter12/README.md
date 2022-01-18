## Usage Notes

- The Python `*.py` files in this directory (execute with Python 3)
  rely on the `DB1.py` module (see the top-level `material/` directory).

  Usage (UNIX-Shell):
  ~~~
  $ python3 ‹file›.py
  ~~~

- List of algebraic operators in module `DB1`:

  - selection (`σ[p](r)`): `select(p, r)` 
  - projection (`π[ℓ](r)`): `project(ℓ, r)` 
  - Cartesian product (`r1 × r2`): `cross(r1, r2)`

