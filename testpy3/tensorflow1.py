import os
import numpy as np
import tensorflow as tf

# Ignore warn: Your CPU supports instructions that this TensorFlow binary
# was not compiled
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

##构造数据##
x_data = np.random.rand(100).astype(np.float32)  # 随机生成100个类型为float32的值
y_data = x_data * 0.1 + 0.3  # 定义方程式y=x_data*A+B

##建立TensorFlow神经计算结构##
weight = tf.Variable(tf.random_uniform([1], -1.0, 1.0))
biases = tf.Variable(tf.zeros([1]))
y = weight * x_data + biases

loss = tf.reduce_mean(tf.square(y - y_data))  # 判断与正确值的差距
optimizer = tf.train.GradientDescentOptimizer(0.5)  # 根据差距进行反向传播修正参数
train = optimizer.minimize(loss)  # 建立训练器

# init=tf.initialize_all_variables() #初始化TensorFlow训练结构
init = tf.global_variables_initializer()  # 初始化TensorFlow训练结构
sess = tf.Session()  # 建立TensorFlow训练会话
sess.run(init)  # 将训练结构装载到会话中

for step in range(400):  # 循环训练400次
    sess.run(train)  # 使用训练器根据训练结构进行训练
    if step % 20 == 0:  # 每20次打印一次训练结果
        print(step, sess.run(weight), sess.run(biases))  # 训练次数，A值，B值
