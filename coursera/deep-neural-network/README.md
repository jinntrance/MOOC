[TOC]

## # Neural Networks

对于激活函数的梯度，

- simoid(x) , $\delta(x)$ 求梯度即为 $\delta(x)*(1-\delta(x))$
- tanh(x) , $t(x)$ 梯度为 $1-(t(x))^2$
- ReLU(x) 梯度: 1 if x >=0 else 0
- Leaky ReLU梯度 1 if x >=0 else 0.01


