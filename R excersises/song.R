song<-function(){
a<-c("One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten")
print("Here we go!")
for(i in 10:1) {
  if(!i==1){
    cat(a[i],"!\n")
    cat("There were", a[i] ,' in the bed\nand the little one said,\n"Roll over, roll over."\nSo they all rolled over and one fell out.\n\n')
    
  }
  else{
    cat(a[i],"!\n")
    cat("There was", a[i] ,"in the bed\nand the little one said,\n'I'm lonely.[sigh].'")
    
  }
}
}


#B.)
#sapply(flights,class)