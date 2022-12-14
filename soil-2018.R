setwd("")

# Load and subset the data that contains biogeochemical measurements
d <- read.csv("data/biogeochemistry.csv", header = TRUE, sep = "\t", dec = ",")

# Crop and tree lines for the agroforestry site
agro <- subset(d, sites=="CA_C" | sites=="CA_T")
crop <- subset(agro, sites=="CA_C")
tree <- subset(agro, sites=="CA_T")

# Upper and lower slopes for the forest site
forest <- subset(d, sites=="F_U" | sites=="F_L")
upper <- subset(forest, sites=="F_U")
lower <- subset(forest, sites=="F_L")

### Comparing means of two groups

# We compare the differences between the crop and tree lines as well as between the upper and lower lines
# First we check which assumptions for statistical tests are met, namely equal variances and the normal distribution
# Small samples sizes make it more difficult and less sensible to judge whether the data is normally distributed
# When in doubt, we use non-parametric tests with fewer assumptions

# pH
var.test(crop$pH, tree$pH) 
shapiro.test(agro$pH)
t.test(crop$pH, tree$pH, var.equal = TRUE)

var.test(upper$pH, lower$pH) 
shapiro.test(forest$pH)
t.test(upper$pH, lower$pH, var.equal = TRUE)

# Soil organic C
var.test(crop$SOC, tree$SOC)
shapiro.test(agro$SOC)
t.test(crop$SOC, tree$SOC, var.equal = TRUE)

var.test(upper$SOC, lower$SOC)
shapiro.test(forest$SOC)
t.test(upper$SOC, lower$SOC, var.equal = TRUE)

# Bulk density
var.test(crop$BD, tree$BD)
shapiro.test(agro$BD)
t.test(crop$BD, tree$BD, var.equal = TRUE)

var.test(upper$BD, lower$BD)
shapiro.test(forest$BD)
wilcox.test(upper$BD, lower$BD)

# Water-filled pore space
var.test(crop$WFPS, tree$WFPS)
shapiro.test(agro$WFPS)
t.test(crop$WFPS, tree$WFPS, var.equal = TRUE)

var.test(upper$WFPS, lower$WFPS)
shapiro.test(forest$WFPS)
t.test(upper$WFPS, lower$WFPS)

# Total N
var.test(crop$N, tree$N)
shapiro.test(agro$N)
wilcox.test(crop$N, tree$N)

var.test(upper$N, lower$N)
shapiro.test(forest$N)
t.test(upper$N, lower$N, var.equal = TRUE)

# Total C:N ratio
var.test(crop$CN_ratio, tree$CN_ratio)
shapiro.test(agro$CN_ratio)
t.test(crop$CN_ratio, tree$CN_ratio, var.equal = TRUE)

var.test(upper$CN_ratio, lower$CN_ratio)
shapiro.test(forest$CN_ratio)
t.test(upper$CN_ratio, lower$CN_ratio, var.equal = TRUE)

# Microbial biomass C
var.test(crop$MB_C, tree$MB_C)
shapiro.test(agro$MB_C)
t.test(crop$MB_C, tree$MB_C, var.equal = TRUE)

var.test(upper$MB_C, lower$MB_C)
shapiro.test(forest$MB_C)
t.test(upper$MB_C, lower$MB_C, var.equal = TRUE)

# Microbial biomass N
var.test(crop$MB_N, tree$MB_N)
shapiro.test(agro$MB_N)
t.test(crop$MB_N, tree$MB_N, var.equal = TRUE)

var.test(upper$MB_N, lower$MB_N)
shapiro.test(forest$MB_N)
t.test(upper$MB_N, lower$MB_N, var.equal = TRUE)

# Microbial biomass C:N ratio
var.test(crop$MB_CN, tree$MB_CN)
shapiro.test(agro$MB_CN)
t.test(crop$MB_CN, tree$MB_CN, var.equal = TRUE)

var.test(upper$MB_CN, lower$MB_CN)
shapiro.test(forest$MB_CN)
t.test(upper$MB_CN, lower$MB_CN, var.equal = TRUE)

# NH4+
var.test(crop$NH4, tree$NH4)
shapiro.test(agro$NH4)
wilcox.test(crop$NH4, tree$NH4)

var.test(upper$NH4, lower$NH4)
shapiro.test(forest$NH4)
wilcox.test(upper$NH4, lower$NH4)

# NO3-
var.test(crop$NO3, tree$NO3)
shapiro.test(agro$NO3)
t.test(crop$NO3, tree$NO3, var.equal = TRUE)

var.test(upper$NO3, lower$NO3)
t.test(crop$NO3, tree$NO3, var.equal = FALSE)

# K2SO4-
var.test(crop$K2SO4, tree$K2SO4)
shapiro.test(agro$K2SO4)
wilcox.test(crop$K2SO4, tree$K2SO4)

var.test(upper$K2SO4, lower$K2SO4)
shapiro.test(forest$K2SO4)
t.test(upper$K2SO4, lower$K2SO4, var.equal = TRUE)

# N fixing rate
var.test(crop$N_fix_rate, tree$N_fix_rate)
t.test(crop$N_fix_rate, tree$N_fix_rate, var.equal = FALSE)

var.test(upper$N_fix_rate, lower$N_fix_rate)
shapiro.test(forest$N_fix_rate)
wilcox.test(upper$N_fix_rate, lower$N_fix_rate)

# The following biogeochemical measures are significantly different between the crop and tree lines at the agroforestry site:
# Water-filled pore space
# Total C:N ratio
# NO3-
# N fixing rate

# The following biogeochemical measures are significantly different between the upper and lower slopes at the forest site:
# Soil organic C
# Bulk density
# NO3-

### Comparing means of more than two groups

# We compare the differences in various biogeochemical metrics between the agroforestry and the forest sites
# We check that what assumptions for statistical tests are met, namely equal variances and the normal distribution of residuals
# Depending on which assumptions are met, we will run the ANOVA, the one-way ANOVA or the Kruskal-Wallis test
# If the null hypothesis is rejected, we will use respective post-hoc tests to see where the difference is

library(car)
library(pgirmess)

# pH
leveneTest(d$pH~d$sites)
shapiro.test(residuals(lm(d$pH~d$sites)))

model <- aov(d$pH~d$sites)
anova(model)

TukeyHSD(model)

# Soil organic C
leveneTest(d$SOC~d$sites)
shapiro.test(residuals(lm(d$SOC~d$sites)))

model <- aov(d$SOC~d$sites)
anova(model)

TukeyHSD(model)

# Bulk density
leveneTest(d$BD~d$sites)
shapiro.test(residuals(lm(d$BD~d$sites)))

model <- aov(d$BD~d$sites)
anova(model)

TukeyHSD(model)

# Water-filled pore space
leveneTest(d$WFPS~d$sites)
shapiro.test(residuals(lm(d$WFPS~d$sites)))

model <- aov(d$WFPS~d$sites)
anova(model)

TukeyHSD(model)

# Total N
leveneTest(d$N~d$sites)
shapiro.test(residuals(lm(d$N~d$sites)))

model <- aov(d$N~d$sites)
anova(model)

# Total C:N ratio
leveneTest(d$CN~d$sites)
shapiro.test(residuals(lm(d$CN~d$sites)))

model <- aov(d$CN~d$sites)
anova(model)

TukeyHSD(model)

# Microbial biomass C
leveneTest(d$MB_C~d$sites)
shapiro.test(residuals(lm(d$MB_C~d$sites)))

model <- aov(d$MB_C~d$sites)
anova(model)

# Microbial biomass N
leveneTest(d$MB_N~d$sites)
shapiro.test(residuals(lm(d$MB_N~d$sites)))

model <- aov(d$MB_N~d$sites)
anova(model)

# Microbial biomass C:N ratio
leveneTest(d$MB_CN~d$sites)
shapiro.test(residuals(lm(d$MB_CN~d$sites)))

model <- aov(d$MB_CN~d$sites)
anova(model)

TukeyHSD(model)

# NH4+
leveneTest(d$NH4~d$sites)
shapiro.test(residuals(lm(d$NH4~d$sites)))

kruskal.test(d$NH4~d$sites)

# NO3-
leveneTest(d$NO3~d$sites)
shapiro.test(residuals(lm(d$NO3~d$sites)))

kruskal.test(d$NO3~d$sites)

kruskalmc(d$NO3~d$sites, probs=0.05, cont=NULL)

# K2SO4-
leveneTest(d$K2SO4~d$sites)
shapiro.test(residuals(lm(d$K2SO4~d$sites)))

kruskal.test(d$K2SO4~d$sites)

kruskalmc(d$K2SO4~d$sites, probs=0.05, cont=NULL)

# N fixing rate
leveneTest(d$N_fix_rate~d$sites)

oneway.test(d$N_fix_rate~d$sites, var.equal = FALSE)

pairwise.t.test(d$N_fix_rate, d$sites, pool.sd = FALSE, paired = FALSE, p.adjust.method = "holm")

# The following biogeochemical measurements are significantly different between the agroforestry and forest sites:
# pH
# Soil organic C
# Bulk density
# Total C:N ratio
# Microbial biomass C:N ratio

# The following biogeochemical measurement is significantly different between the crop lines in the agroforestry site and the forest site:
# Water-filled pore space

# The following biogeochemical measurement is significantly different between the crop lines in the agroforestry site and the lower slopes of the forest site:
# NO3-
  
# The following biogeochemical measurement is significantly different between the tree lines in the agroforestry site and the lower slopes of the forest site:
# K2SO4-
  
# There is no significant differences between the agroforestry and forest sites:
# Total N
# Microbial biomass C
# Microbial biomass N
# NH4+
# N fixing rate
