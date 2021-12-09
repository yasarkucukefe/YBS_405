
## Gerekli olan pakenleri yükle
# install.packages(pacman)
pacman::p_load("class")

# Verileri oku
df = read.csv("ccdefault.csv", header = T)

# Verilerin normalizasyonu
normalize = function(x) {
  norm = ((x - min(x)) / (max(x) - min(x)))
  return (norm)
}

dfn = as.data.frame(lapply(df[, c(-1,-25)], normalize)) 
# dfn = as.data.frame(lapply(df[, 2:24], normalize)) 
dfn = cbind(dfn, df[, 25])
names(dfn)[24] = "DEFAULT"

# Eğitim ve Test verilerini ayrılması
dfn.split = sample(2, nrow(dfn), replace = TRUE, prob= c(0.7, 0.3))

dfn.train = dfn[dfn.split == 1, 1:23]
dfn.test = dfn[dfn.split == 2, 1:23]

dfn.train.labels = dfn[dfn.split == 1, 24]
dfn.test.labels = dfn[dfn.split == 2, 24]

## Sınıflandırıcı modeli
dfn.pred = knn(train = dfn.train, test = dfn.test, cl = dfn.train.labels, k=9)

table(dfn.pred, dfn.test.labels)



