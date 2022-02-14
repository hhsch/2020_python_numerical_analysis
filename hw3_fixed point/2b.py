import matplotlib.pyplot as plt
import math

def f(x):
    return 4 + 1/3 * math.sin(2*x) - x

def g1(x):
    return 4 + 1/3 * math.sin(2*x)

def g2(x):
    fx = 4 + 1/3 * math.sin(2*x) - x
    fpx = 2/3 * math.cos(2*x) - 1
    return x -  fx / fpx

def g3(x):
    fx = 4 + 1/3 * math.sin(2*x) - x
    fpx = 2/3 * math.cos(2*x) - 1
    fppx = -4/3 * math.sin(2*x)
    return x -  fx / fpx - fppx / (2*fpx) * (fx / fpx)**2


def fp(func, x0, eps):
    x = x0
    k = 0
    its = []
    its.append(x0)

    while (abs(func(x) - x) >= eps):
        k += 1
        x = func(x)
        its.append(x)

    return [its, k]

if __name__ == '__main__':
    eps = 1e-8
    x0 = 4

    fig, axs = plt.subplots(1,2)

    its, k = fp(g1, x0, eps)
    err = [abs(its[i+1] - its[i]) for i in range(k)]
    axs[0].plot(err, linewidth=10)
    axs[1].plot(err[:-1], err[1:], linewidth=10)

    its, k = fp(g2, x0, eps)
    err = [abs(its[i+1] - its[i]) for i in range(k)]
    axs[0].plot(err, linewidth=10)
    axs[1].plot(err[:-1], err[1:], linewidth=10)

    its, k = fp(g3, x0, eps)
    err = [abs(its[i+1] - its[i]) for i in range(k)]
    axs[0].plot(err, linewidth=10)
    axs[1].plot(err[:-1], err[1:], linewidth=10)

    fig.suptitle('Analysis of error under fixed point iteration', fontsize=35)

    axs[0].grid(True)
    axs[1].grid(True)
    
    axs[0].set_xlabel('Iteration number', fontsize=30)
    axs[0].set_ylabel('Residual ($\\vert x_{k+1} - x_k \\vert$)', fontsize=30)
    axs[1].set_xlabel('Previous residual ($e_{k-1}$)', fontsize=30)
    axs[1].set_ylabel('Current residual ($e_k$)', fontsize=30)

    axs[0].tick_params(axis='both', labelsize=20)
    axs[1].tick_params(axis='both', labelsize=20)

    axs[0].set_yscale('log')
    axs[1].set_xscale('log')
    axs[1].set_yscale('log')

    axs[0].legend(('$x + f(x)$', '$x - \\frac{f(x)}{f\'(x)}$', '$x - \\frac{f(x)}{f\'(x)} - \\frac{f\'\'(x)}{2f\'(x)} \\left[ \\frac{f(x)}{f\'(x)} \\right]^2$'), fontsize=20)
    axs[1].legend(('$x + f(x)$', '$x - \\frac{f(x)}{f\'(x)}$', '$x - \\frac{f(x)}{f\'(x)} - \\frac{f\'\'(x)}{2f\'(x)} \\left[ \\frac{f(x)}{f\'(x)} \\right]^2$'), fontsize=20)

    plt.show()

