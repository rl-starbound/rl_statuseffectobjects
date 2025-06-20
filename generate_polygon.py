import argparse
import json
import math


# Blocks are 8x8 pixels. However, divide them once more for better
# rounding, giving an epsilon of 1/16th.
epsilon = 1 / 16


def approx_value(v):
    ident = v >= 0 and 1 or -1
    i = int(v)
    remainder = v % ident
    approx = int(remainder / epsilon) * epsilon
    return i + approx


def circle_points(ox, oy, radius, n):
    points = []
    for i in range(n):
        angle = 2 * math.pi * i / n
        x = ox + approx_value(radius * math.cos(angle))
        y = oy + approx_value(radius * math.sin(angle))
        points.append([x, y])
    return points


def bound_box(points):
    lowestX = None
    lowestY = None
    highestX = None
    highestY = None
    for point in points:
        if not lowestX or point[0] < lowestX: lowestX = point[0]
        if not lowestY or point[1] < lowestY: lowestY = point[1]
        if not highestX or point[0] > highestX: highestX = point[0]
        if not highestY or point[1] > highestY: highestY = point[1]
    lowestX = lowestX and math.floor(lowestX)
    lowestY = lowestY and math.floor(lowestY)
    highestX = highestX and math.ceil(highestX)
    highestY = highestY and math.ceil(highestY)
    return [lowestX, lowestY, highestX, highestY]


def polygonCardinality(s):
    x = int(s)
    if x < 3:
        raise ValueError("value must be at least 3")
    return x


def positiveFloat(s):
    x = float(s)
    if x < 1:
        raise ValueError("value must be at least 1")
    return x


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Command to generate an equilateral convex n-sided polygon inscribed within a circle of a given radius around an origin point, and a bounding box around the polygon.",
        epilog="The first line of output is the polygon. The second is the bounding box."
    )

    parser.add_argument("originX", type=float)
    parser.add_argument("originY", type=float)
    parser.add_argument("radius", type=positiveFloat)
    parser.add_argument("cardinality", type=polygonCardinality)

    args = parser.parse_args()

    points = circle_points(
        approx_value(args.originX), approx_value(args.originY),
        args.radius, args.cardinality
    )
    box = bound_box(points)
    print(json.dumps(points))
    print(json.dumps(box))
