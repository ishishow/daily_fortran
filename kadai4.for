C----------
C234567
      parameter(num=345)
      real doy(num),dpt(num),csal(num),bsal(num),ss(num),stn(num)
      open(10,file="./data.txt")
      do k=1,num
      read(10,*) doy(k),dpt(k),csal(k),bsal(k),ss(k),stn(k)
      enddo
      close(10)

      CsalGoukei=0
      BsalGoukei=0
      do k=1,num
       CsalGoukei=CsalGoukei+csal(k)
       BsalGoukei=BsalGoukei+bsal(k)
      enddo

      count=0
      CsalHeikin=CsalGoukei/num
      BsalHeikin=BsalGoukei/num
      write(*,*)"CsalHeikin=",CsalHeikin
      write(*,*)"BsalHeikin=",BsalHeikin
      CsalZansa=0
      BsalZansa=0
      CyouBunsan=0

      do k=1,num
       Csalup=csal(k)-CsalHeikin
       Bsalup=bsal(k)-BsalHeikin
       write(*,*)"Bsalup=",Bsalup
       Aa=Csalup*Bsalup
       write(*,*)"Aa=",Aa
       CyouBunsan=CyouBunsan+Aa
       write(*,*)"CyouBunsan=",CyouBunsan
       CsalZansa=CsalZansa+(csal(k)-CsalHeikin)**2
       BsalZansa=BsalZansa+(bsal(k)-BsalHeikin)**2
      enddo

      CsalBunsan=CsalZansa/num
      BsalBunsan=BsalZansa/num
      CyouBunsan=CyouBunsan/num
      CsalHensa=sqrt(CsalBunsan)
      BsalHensa=sqrt(BsalBunsan)
      Soukan=CyouBunsan/CsalHensa
      Soukan=Soukan/BsalHensa
      write(*,*)"CsalHensa=",CsalHensa
      write(*,*)"BsalHensa=",BsalHensa
      write(*,*)"CyouBunsan=",CyouBunsan
      write(*,*)"Soukan=",Soukan

      stop
      end
C----------
