import random

states = ('Rainy', 'Sunny')
observations = ('walk', 'shop', 'clean')
start_probability = {'Rainy': 0.6, 'Sunny': 0.4}
transition_probability = {
    'Rainy': {'Rainy': 0.7, 'Sunny': 0.3},
    'Sunny': {'Rainy': 0.4, 'Sunny': 0.6},
}
emission_probability = {
    'Rainy': {'walk': 0.1, 'shop': 0.4, 'clean': 0.5},
    'Sunny': {'walk': 0.6, 'shop': 0.3, 'clean': 0.1},
}


def choice(probability):
    s = 0
    state = random.random()
    for k, v in probability.iteritems():
        s += v
        if state < s:
            return k


def main():
    state = choice(start_probability)
    for step in xrange(100):
        out = choice(emission_probability[state])
        print state, out
        state = choice(transition_probability[state])


if __name__ == '__main__':
    main()
