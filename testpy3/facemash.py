#!/usr/bin/env python3
import math


def EloRating(ra, rb, sa, k=16):
    """
    Elo Rating System
    ra - player A's current rank score.
    rb - player B's current rank score.
    sa - 1 if A win, 0 otherwise.
    k  - The K-factor. k = 16 by default.
    (ran, rbn) - return the new rank score for next rating.

    Reference
    https://en.wikipedia.org/wiki/Elo_rating_system
    """

    ea = 1/(1+math.pow(10, (rb-ra)/400))
    # ea = 1/(1+10**((rb-ra)/400))
    ran = ra + k*(sa-ea)
    rbn = rb - k*(sa-ea)
    return (ran, rbn)


def main():
    ra = rb = 0
    li = [1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0,
          0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    for i in li:
        ra, rb = EloRating(ra, rb, i)
        print(ra, rb)

if __name__ == '__main__':
    main()
