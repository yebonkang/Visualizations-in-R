a = ggplot(mtcars) + geom_point(aes(hp,mpg))
b= ggplot(mtcars) +
  geom_histogram(aes(hp))
c= ggplot(mtcars) +
  geom_histogram(aes(mpg))

grid.arrange(a,b,c,nrow=2,ncol=2)

# 표준정규분포 & 자유도=3인 t분포 같이 그리기
# x축 범위 설정
aa = seq(-4,4,by=0.1)

# aa이용하여 정규분포 확률밀도함수값 생성
bb = dnorm(aa,0,1)
abc1 = data.frame(aa,bb)
head(abc1)

## aa 이용하여 자유도 3인 t 분포 확률밀도함수 값 생성
cc = dt(aa, 3)
abc2 = data.frame(aa,cc)
head(abc2)

ggplot(abc1) +
  geom_line(aes(x=aa,y=bb), color="blue", linetype=5) +
  geom_area(data=abc2, aes(x=aa, y=cc), fill="red", alpha=0.3)

# 하나의 데이터로 두개의 그래프 그리기
dd = dnorm(aa, 1, 1) 
abc3 = data.frame(aa,bb,dd)

ggplot(abc3) +
  geom_area(aes(x=aa, y=dd), fill="blue", alpha=0.2) +
  geom_area(aes(x=aa, y=bb), fill="red", alpha=0.2)
