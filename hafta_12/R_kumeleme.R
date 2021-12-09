# Veri dosyasını oku
data = read.csv("ClusterData.csv", header = T)
colnames(data)

# Sadece sayısal değer içeren kolonları seç
st = data[, 3:27]
row.names(st) = data[,2]
colnames(st)

# Mesafe matrisi
d = dist(st)

# Hiyerarşik kümeleme
c = hclust(d)

# Plot dendrogram
plot(c, main="Cluster with all searches")

# Farklı bir plot yöntemi
hcd <- as.dendrogram(c)
# Default plot
plot(hcd, type = "rectangle", ylab = "Height")



