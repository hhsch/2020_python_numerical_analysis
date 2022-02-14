import matplotlib.pyplot as plt

def g(x):
    return x/2 + 2/x

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
    actual = 2

    its, k = fp(g, x0, eps)

    err = [it - actual for it in its]

    fig, axs = plt.subplots(1,2)

    axs[0].plot(range(k+1), err, linewidth=10)
    axs[1].plot(err[:-1], err[1:], linewidth=10)

    fig.suptitle('Analysis of error under fixed point iteration', fontsize=35)

    axs[0].grid(True)
    axs[1].grid(True)
    
    axs[0].set_xlabel('Iteration number', fontsize=30)
    axs[0].set_ylabel('Absolute error', fontsize=30)
    axs[1].set_xlabel('Previous error ($e_{k-1}$)', fontsize=30)
    axs[1].set_ylabel('Current error ($e_k$)', fontsize=30)

    axs[0].tick_params(axis='both', labelsize=20)
    axs[1].tick_params(axis='both', labelsize=20)

    axs[0].set_yscale('log')
    axs[1].set_xscale('log')
    axs[1].set_yscale('log')

    p = [(err[i+2] - err[i+1]) / (err[i+1] - err[i]) for i in range(k-1)]

    print(p)

    plt.show()

