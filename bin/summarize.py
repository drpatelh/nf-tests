#!/usr/bin/env python3

from sys import argv

import pandas as pd


def read_data(inputfile):
    """Read in a dataframe from csv"""

    return pd.read_csv(inputfile)


if __name__ == "__main__":

    df = read_data(argv[1])
    summary = df.describe()
    summary.to_csv("summary.csv")
