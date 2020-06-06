C----------
C234567
      parameter(num=345)
      real doy(num),dpt(num),csal(num),bsal(num),ss(num),stn(num)
      open(10,file="./data.txt")
      do k=1,num
      read(10,*) doy(k),dpt(k),csal(k),bsal(k),ss(k),stn(k)
      enddo
      close(10)

      Goukei=0
      do k=1,num
       Goukei=Goukei+csal(k)
      enddo

      count=0
      Heikin=Goukei/num
      Zansa=0
      do k=1,num
       up=csal(k)-Heikin
       down=Heikin-csal(k)
       o=0.07
       if(up.le.o.and.down.le.o)then
        Zansa=Zansa+(csal(k)-Heikin)**2
        count=count+1
       else
        write(*,*)"abnormal=",csal(k)
       endif
      enddo

      Bunsan=Zansa/count

      Hensa=sqrt(Bunsan)
      write(*,*)"Hensa=",Hensa

      stop
      end
C----------
