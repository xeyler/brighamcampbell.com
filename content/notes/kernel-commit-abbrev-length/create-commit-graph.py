# run the following to generate the required sorted list of commit timestamps:
# git cat-file --batch-check --batch-all-objects --unordered | grep commit | cut -d' ' -f1 | xargs -I ^ git log -1 --pretty="format:%ct%n" ^ > commit-times-unix-timestamp
# cat commit-times-unix-timestamp | sort > commit-times-unix-timestamp-chronological

import matplotlib.pyplot as plt
import numpy as np

import matplotlib.ticker as ticker

from scipy.optimize import curve_fit

from datetime import date

fix, axs = plt.subplots()

commits = 0

with open("commit-times-unix-timestamp-chronological", "r") as timestamps:
    for timestamp in timestamps:
        commits = commits + 1

x = np.zeros((commits,), dtype='datetime64[s]')

i = 0

with open("commit-times-unix-timestamp-chronological", "r") as timestamps:
    for timestamp in timestamps:
        x[i] = np.datetime64(int(timestamp), 's')
        i = i + 1

y = np.arange(commits)

# quadratic
def objective(x, a, b, c):
    return a * np.square(x) + b * x + c

popt, _ = curve_fit(objective, x, y)

a, b, c = popt
print(f"y = {a}x^2 + {b}x + {c}")

COMMITS_FOR_P_01 = 2378620

end_of_days = np.datetime64(int(np.max(np.roots([a, b, c - COMMITS_FOR_P_01]))), 's')

x_fit = np.arange(x[0].astype(np.int64), end_of_days.astype(np.int64), 100)
y_fit = objective(x_fit, a, b, c)

plt.grid(axis='x', color='0.88')
plt.grid(axis='y', color='0.88')
plt.step(x, y, color="black", label='Commits')
plt.plot(x_fit.astype(np.datetime64), y_fit, '--', color="red", alpha=0.6, label='Best Fit Prediction (Quadratic)')

last_date_real = x[commits - 1]

axs.annotate(f"p ≈ 0.35%\n{last_date_real.astype('datetime64[D]')}", xy=(x[commits - 1], y[commits - 1]), xytext=(10, -30), textcoords='offset pixels')
axs.annotate(f"p ≈ 1%\n{end_of_days.astype('datetime64[D]')}", xy=(end_of_days, COMMITS_FOR_P_01), xytext=(10, -30), textcoords='offset pixels')

axs.set_xlim([x[0] - 70000000, end_of_days + 170000000])

fig = plt.gcf()
fig.set_dpi(100.0)
fig.set_figwidth(7)

plt.legend()
plt.show()

