---
author:
- Tyler J. Brough
title: Economics 6330 -- Applied Econometrics
---

::: {.frame}
:::

# ECN6330 Agenda for 02/04/2011

::: {.frame}
### Agenda for Tonight

-   Quiz 3

-   Brief Review of Statistical Inference

-   Discuss further topics in Mathematical Statistics:

    -   Large sample properties of estimators

    -   Confidence intervals

    -   Hypothesis testing
:::

# Brief Review of Some Concepts

::: {.frame}
### The Normal Distribution

The normal probability density function is defined as follows:

$$f(x) = \frac{1}{\sigma \sqrt{2\pi}} \exp{\frac{-(X-\mu)^{2}}{2\sigma^{2}}}, \quad \mbox{for $-\infty < x < \infty$}$$

where $E(X) = \mu$ and $Var(X) = \sigma^{2}$. When a random variable is
normally distributed we write $X \sim N(\mu, \sigma^{2})$.
:::

::: {.frame}
### The Normal Distribution

A special case is the standard normal distribution, which is defined as
follows:

$$\phi(z) = \frac{1}{\sqrt{2\pi}} \exp\left\{\frac{-z^{2}}{2}\right\}, \quad \mbox{for $-\infty < z < \infty$}$$

The standard normal cumulative distribution function is denoted by
$\Phi(z) = P(Z \leq z)$. Using some basic facts from probability we
arrive at the following helpful formulas:

$$\begin{aligned}
P(Z > z)  &= 1 - \Phi(z) \\
P(Z < -z) &= P(Z > z) \\
P(a \leq Z \leq b) &= \Phi(b) - \Phi(a)\end{aligned}$$
:::

::: {.frame}
### The Chi-Square Distribution

The chi--square distribution is obtained directly from independent,
standard normal random variables. Let $Z_{i}$, $i = 1, 2, \ldots, n$, be
independent random variables, each distributed as standard normal.
Define a new random variable as the sum of the squares of the individual
$Z_{i}$:

$$X = \sum\limits_{i=1}^{n} Z_{i}^{2}$$

The new random variable $X$ has a chi--square distribution with $n$
degrees of freedom. This is often written as $X \sim \chi_{n}^{2}$.
:::

::: {.frame}
### The Student $T$ Distribution

The $t$ distribution is a workhorse in classical statistics and
econometrics. A $t$ distribution is obtained from a standard normal and
a chi--square random variable. Let $Z$ have a standard normal
distribution and let $X$ have a chi-square distribution with $n$ degrees
of freedom. Also assume that $Z$ and $X$ are independent. Then the
following random variable

$$T = \frac{Z}{\sqrt{X/n}}$$

has a $t$ distribution with $n$ degrees of freedom. This is denoted by
$T \sim t_{n}$. The $t$ distribution gets its degrees of freedom from
the chi--square random variable.
:::

::: {.frame}
### The $F$ Distribution

Another important distribution for statistics and econometrics is the
$F$ distribution. To define an $F$ random variable, let
$X_{1} \sim \chi_{k_{1}}^{2}$ and $X_{2} \sim \chi_{k_{2}}^{2}$ and
assume that $X_{1}$ and $X_{2}$ are independent. Then, the random
variable

$$F = \frac{X_{1}/k_{1}}{X_{2}/k_{2}}$$

has an $F$ distribution with $(k_{1}, k_{2})$ degrees of freedom. We
denote this as $F \sim F_{k_{1}, k_{2}}$. The order of the degrees of
freedom is important. $k_{1}$ is the *numerator degrees of freedom* and
$k_{2}$ is the *denominator degrees of freedom*.
:::

# Mathematical Statistics

::: {.frame}
### Large Sample Properties of Estimators

We saw with the estimator of $\mu$, $W = Y_{1}$ that it was an unbiased,
but poor estimator. One notable feature of $Y_{1}$ is that its variance
is the same no matter what its sample size. It is reasonable to require
that as the
$\left[n \rightarrow \infty \mbox{,} \quad \sigma^{2} \rightarrow 0\right]$
sample size increases the estimation procedure improves.

Example: $\bar{Y}$ for estimation of population mean $\mu$

$$s^{2} = Var(\bar{Y}) = \frac{1}{n-1} \sum\limits_{i=1}^{n} (Y_{i} - \bar{Y})^{2}$$

As $n \rightarrow \infty$, $s^{2} \rightarrow 0$.
:::

::: {.frame}
### Consistency

Let $W_{n}$ be an estimator of $\theta$ based on a sample
$Y_{1}, Y_{2}, \ldots, Y_{n}$ of size $n$. Then $W_{n}$ is a *consistent
estimator* of $\theta$ if for every $\epsilon > 0$

$$P(|W_{n} - \theta| > \epsilon) \rightarrow 0 \quad \mbox{as} \quad n \rightarrow \infty$$

If $W_{n}$ is not consistent for $\theta$, we say it is *inconsistent*.
When $W_{n}$ is consistent, we also say that $\theta$ is the probability
limit of $W_{n}$, written as

$$plim(W_{n}) = \theta$$

Interpretation:

-   The distribution of $W_{n}$ becomes more and more concentrated about
    $\theta$, which means that for larger sample sizes, $W_{n}$ is less
    and less likely to vary far from $\theta$.
:::

::: {.frame}
### R Simulation to Show Consistency

-   Go to R, then come back.

-   See R code *lln.r* on BB.
:::

::: {.frame}
### The Law of Large Numbers

Let $Y_{1}, Y_{2}, \ldots, Y_{n}$ be independent, identically
distributed random variables with mean $\mu$. Then

$$plim(\bar{Y}) = \mu$$

Interpretation:

-   If we want to estimate the population average $\mu$, we can get
    arbitrarily close to $\mu$ by choosing a sufficiently large sample.
:::

::: {.frame}
### Properties of the Probability Limit

**Propery PLIM1:**\
Let $\theta$ be a parameter and define a new parameter
$\gamma = g(\theta)$, for some continuous function $g(\theta)$. Suppose
that $plim(W_{n}) = \theta$. Define an estimator $\gamma$ by
$G_{n} = g(W_{n})$. Then $plim(G_{n}) = \gamma$.

Often stated as: $plim(g(W_{n})) = g(plim(W_{n}))$ for a continuous
function $g(\theta)$.

Example: $g(\theta) = a + b \theta$, $g(\theta) = \sigma^{2}$,
$g(\theta) = \frac{1}{\theta}$, $g(\theta) = \sqrt{\theta}$,
$g(\theta) = \exp{\theta}$.
:::

::: {.frame}
### Properties of the Probability Limit

**Property PLIM2:**\
If $plim(T_{n}) = \alpha$ and $plim(U_{n}) = \beta$ then

-   $plim(T_{n} + U_{n}) = \alpha + \beta$

-   $plim(T_{n}U_{n}) = \alpha \beta$

-   $plim\left(\frac{T_{n}}{U_{n}} \right) = \frac{\alpha}{\beta}$, for
    $\beta \neq 0$
:::

::: {.frame}
### An Example

Example: Let $\left\{Y_{1}, Y_{2}, \ldots, Y_{n} \right\}$ be a random
sample of size $n$ an annual earnings from the population of workers
with a high school education with population mean $\mu_{Y}$.

Let $\left\{Z_{1}, Z_{2}, \ldots, Z_{n} \right\}$ be a random sample of
size $n$ on annual earnings from the population of workers with a
college education with population mean $\mu_{Z}$.

We wish to estimate the percentage difference in annual earnings between
the two groups, which is
$\gamma = 100 \frac{(\mu_{Z} - \mu_{Y})}{\mu_{Y}}$, the percentage by
which earnings for college grads differs from high school grads.

Because $\bar{Y}$ is consistent for $\mu_{Y}$, and $\bar{Z}_{n}$ is
consistent for $\mu_{Z}$ it follows that

$$G_{n} = 100 \frac{(\bar{Z}_{n} - \bar{Y}_{n})}{\bar{Y_{n}}}$$

is a consistent estimator of $\gamma$.
:::

::: {.frame}
### Asymptotic Normality

Let $\left\{Z_{n}: n = 1, 2, \ldots \right\}$ be a sequence of random
variables, such that for all numbers $Z$

$$P(Z_{n} \leq z) \rightarrow \Phi(z) \quad \mbox{as} \quad n \rightarrow \infty$$

in which $\Phi(z)$ is the standard normal CDF. $Z_{n}$ is said to have
an asymptotic standard normal distribution.

Asymptotic normality holds for large $n$, we have the approximation
$P(Z_{n} \leq z) \approx \Phi(z)$. This means that probabilities
concerning $Z_{n}$ can be approximated by the standard normal
probabilities.
:::

::: {.frame}
### The Central Limit Theorm

Let $\left\{Y_{1}, Y_{2}, \ldots, Y_{n} \right\}$ be a random sample
with mean $\mu$ and variance $\sigma^{2}$. Then

$$Z_{n} = \frac{\bar{Y} - \mu}{\sigma/\sqrt{n}}$$

has an asymptotic standard normal distribution.
:::

::: {.frame}
### Confidence Interval Estimation

A *Confidence Interval* is a range of values, calculated from the sample
observations, that are believed, with a particular probability, to
contain the true parameter value.
:::

::: {.frame}
### An Example of Confidence Interval Estimation

Example:

Suppose the population has a $N(\mu, \sigma = 1)$ distribution and let
$\left\{Y_{1}, Y_{2}, \ldots, Y_{n} \right\}$ be a random sample from
this population (assume $\sigma = 1$ known).

The sample average $\bar{Y}$ has a normal distribution with mean $\mu$
and variance $\frac{1}{n}$

$$\bar{Y} \sim N\left( \mu, \frac{1}{n} \right)$$

Standardizing $\bar{Y}$ which will give it a standard normal
distribution

$$P \left( -1.96 < \frac{\bar{Y} - \mu}{1/\sqrt{n}} < 1.96 \right) = 0.95$$

Tells us that the probability that the random interval
$[\bar{Y} - 1.96/\sqrt{n}, \bar{Y} + 1.96/\sqrt{n} ]$, contains the
population mean $\mu$ is $0.95$ or $95\%$.
:::

# Confidence Intervals

::: {.frame}
### Confidence Interval Estimation

This allows us to construct an interval estimate of $\mu$

$$$$

This is called a $95\%$ confidence interval. This is denoted as
$\bar{y} \pm 1.96/\sqrt{n}$.
:::

::: {.frame}
### Confidence Interval Estimation

Example: suppose $n = 16$ and $\bar{y} = 7.3$ then

$$7.3 \pm 1.96/\sqrt{16} = 7.3 \pm 0.49 = [6.81 \mbox{,} 7.79]$$
:::

::: {.frame}
### Confidence Interval Estimation

Interpretation: the random interval
$[\bar{Y} - 1.96/\sqrt{n} \mbox{,} \quad \bar{Y} + 1.96/\sqrt{n}]$
contains $\mu$ with probability $0.95$.

In other words, if we sampled from the population and calculated the
random interval infinitely many times, it would contain the population
parameter $\mu$ $95\%$ of the time.

Note: It does not mean:
$P(\bar{Y} - 1.96/\sqrt{n} \leq \mu \leq + 1.96/\sqrt{n}) = 0.95$
because parameters $\theta$ are *not* variables.
:::

::: {.frame}
### Confidence Interval Estimation

-   R simulation exercise to show confidence intervals.

-   See R code *interval.r* on BB.
:::

::: {.frame}
### The Confidence Interval for the Mean of a Normal Population

Assume $X \sim N(\mu, \sigma)$ and $\sigma$ is known to be any value,
the $95\%$ CI is

$$$$
:::

::: {.frame}
### Confidence Interval for the Mean of a Normal Population

To allow for unknown $\sigma$, we must use an estimate. Let

$$s = \left( \frac{1}{n-1} \sum\limits_{i=1}^{n} (y_{i} - \bar{y})^{2} \right)^{1/2}$$

denote the sample standard deviation. Using $s$ for $\sigma$ does not
preserve the $95\%$ CI because we must use the sample to calculate $s$.
In this case we will rely on the $t$ distribution

$$\frac{\bar{Y} - \mu}{S/\sqrt{n}} \sim t_{n-1}$$

Where $\bar{Y}$ is the sample average and $s$ is the sample standard
deviation of the random sample
$\left\{ Y_{1}, Y_{2}, \ldots, Y_{n} \right\}$. To construct a $95\%$ CI
let $c$ denote the $97.5$ percentile in the $t_{n-1}$ distribution.
:::

::: {.frame}
### Confidence Interval for the Mean of a Normal Population

![image](FigureC4.jpg)
:::

::: {.frame}
### Confidence Interval for the Mean of a Normal Population

In other words:

$$P(-c < t_{n-1} < c) = 0.95$$

For a particular sample

$$$$
:::

::: {.frame}
### Confidence Interval for the Mean of a Normal Population: Example

Example: $c$ is chosen from statistical tables for the $t_{n-1}$
distribution. If $n=20$ then the $df = 20 - 1 = 19$ Then we have
$c = 2.093$ and thus

$$$$

Example: Consider job training grants on worker production. Let

-   $n = 20$

-   $c = 2.093$

-   $\bar{y} = 1.15$

-   $se(\bar{y}) = 0.54$
:::

::: {.frame}
### Confidence Interval for the Mean of a Normal Population: Example

Then we have

$$CI_{0.95} = [-2.28 \mbox{,} -0.02]$$

Interpretation: Zero is excluded. We conclude with $95\%$ confidence
that average change in scrap rates is not zero.
:::

::: {.frame}
### A Simple Rule of Thumb

A simple rule of thumb for a $95\%$ confidence interval is

-   The $t$ distribution approaches the Normal distribution as the
    degrees of freedom get large.

-   In particular for $\alpha=0.05$,
    $C_{\frac{\alpha}{2}} \rightarrow 1.96$ as $n \rightarrow \infty$.

-   An approximate $95\%$ CI is

$$$$
:::

::: {.frame}
### Asymptotic Confidence Intervals for Non-Normal Populations
:::
