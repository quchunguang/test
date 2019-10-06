import tensorflow as tf
import numpy as np

with tf.Session() as sess:
    # Set up two variables, total and weights, that we'll change repeatedly.
    total = tf.Variable(tf.zeros([1, 2]))
    weights = tf.Variable(tf.random_uniform([1, 2]))

    # Initialize the variables we defined above.
    tf.global_variables_initializer().run()

    # This only adds the operators to the graph right now. The assignment
    # and addition operations are not performed yet.
    update_weights = tf.assign(weights, tf.random_uniform([1, 2], -1.0, 1.0))
    update_total = tf.assign(total, tf.add(total, weights))

    for _ in range(5):
        # Actually run the operation graph, so randomly generate weights and then
        # add them into the total. Order does matter here. We need to update
        # the weights before updating the total.
        sess.run(update_weights)
        sess.run(update_total)

        print(weights.eval(), total.eval())
