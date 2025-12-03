library(ggplot2)

ins <- read.csv("insurance.csv")

ins$bmi_cat <- ifelse(ins$bmi > 30, "high", "normal")
ins$age_bin <- cut(
  ins$age,
  breaks = seq(0, 100, by = 10),
  labels = c("0-9","10-19","20-29","30-39","40-49","50-59","60-69","70-79","80-89","90-99"),
  right = FALSE,
  include.lowest = TRUE
)

model1 <- lm(charges ~ age, data = ins)
model2 <- lm(charges ~ age + bmi + children + smoker, data = ins)

pred1 <- predict(model1)
pred2 <- predict(model2)

ins$pred1 <- pred1
ins$pred2 <- pred2


p1 <- ggplot(ins, aes(bmi_cat, charges)) +
  geom_boxplot() +
  ggtitle("Charges by BMI")
ggsave("charges_by_bmi.png", p1, width=6, height=4)

p2 <- ggplot(ins, aes(region, charges)) +
  geom_boxplot() +
  ggtitle("Charges by Region")
ggsave("charges_by_region.png", p2, width=6, height=4)

p3 <- ggplot(ins, aes(sex, charges)) +
  geom_boxplot() +
  ggtitle("Charges bs Sex")
ggsave("charges_by_sex.png", p3, width=6, height=4)

p4 <- ggplot(ins, aes(age_bin, charges)) +
  geom_boxplot() +
  ggtitle("Charges by Age")
ggsave("charges_by_age.png", p4, width=6, height=4)

p5 <- ggplot(ins, aes(pred1, charges)) +
  geom_point() +
  geom_abline(intercept=0, slope=1) +
  ggtitle("Predicted vs Actual (Model 1)")

ggsave("plot_pred_vs_actual1.png", p5, width=6, height=4)

p6 <- ggplot(ins, aes(pred2, charges)) +
  geom_point() +
  geom_abline(intercept=0, slope=1) +
  ggtitle("Predicted vs Actual (Model 2)")

ggsave("plot_pred_vs_actual2.png", p6, width=6, height=4)
