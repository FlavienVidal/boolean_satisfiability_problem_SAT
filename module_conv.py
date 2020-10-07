"""Generic module for using pymzn nicely in a Jupyter notebook."""

import nest_asyncio
import matplotlib.pyplot as plt
import numpy as np
from minizinc import Instance, Model, Solver

nest_asyncio.apply()

# Exports
gecode = Solver.lookup("gecode")
chuffed = Solver.lookup("chuffed")
cbc = Solver.lookup("cbc")


def minizinc(*files, solver=gecode, data={}, all_solutions=False):
    """Solve using minizinc."""
    model = Model(files)
    instance = Instance(solver, model)
    for key, value in data.items():
        if isinstance(value, str):
            instance.add_string(f'{key} = {value};\n')
        else:
            instance[key] = value
    return instance.solve(all_solutions=all_solutions)
