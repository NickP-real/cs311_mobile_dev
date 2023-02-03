#!/usr/bin/env python

import csv


def main():
    tambon_district = dict()
    with open("./tambon_chiangmai.csv", "r") as file:
        csvreader = csv.reader(file)
        for row in csvreader:
            if row[1] not in tambon_district:
                tambon_district[row[1]] = []
            tambon_district[row[1]].append(row[0])

        print(tambon_district)


if __name__ == "__main__":
    main()
