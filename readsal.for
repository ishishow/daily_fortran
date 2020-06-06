C----------
C234567
      parameter(num=345)
      real doy(num),dpt(num),csal(num),bsal(num),ss(num),stn(num)
      open(10,file="./data.txt")
      do k=1,num
      read(10,*) doy(k),dpt(k),csal(k),bsal(k),ss(k),stn(k)
      write(*,*)doy(k),dpt(k),csal(k),bsal(k),ss(k),stn(k)      
      enddo
      close(10)
      stop
      end
C----------
