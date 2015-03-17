# R CMD BATCH test.r

pdf("genpdf.pdf")
hist(rnorm(100))
dev.off()
