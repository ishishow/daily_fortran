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
      Cb=0
      Cd=0
      do k=1,num
       CsalGoukei=CsalGoukei+csal(k)
       BsalGoukei=BsalGoukei+bsal(k)
       Cb=Cb+csal(k)**2
       Cd=Cd+csal(k)*bsal(k)
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
       Aa=Csalup*Bsalup
       CyouBunsan=CyouBunsan+Aa
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
      Aaa=(Cd*num-BsalGoukei*CsalGoukei)/(num*Cb-CsalGoukei**2)
      Bbb=(Cb*BsalGoukei-Cd*CsalGoukei)/(num*Cb-CsalGoukei**2)
      write(*,*)"CsalHensa=",CsalHensa
      write(*,*)"BsalHensa=",BsalHensa
      write(*,*)"CyouBunsan=",CyouBunsan
      write(*,*)"Soukan=",Soukan
      write(*,*)"katamuki=",Aaa
      write(*,*)"Seppen=",Bbb
      Assr=0
      do k=1,num
        Ayosalt=Aaa*bsal(k)+Bbb+1.08
        Assr=Assr+(csal(k)-Ayosalt)**2
      enddo
      Atss=CsalBunsan*num
      write(*,*)"SSR=",Assr
      write(*,*)"TSS=",Atss
      Ansss=sqrt(1-(Assr/Atss))
      write(*,*)"Ketteikeisu=",Ansss
      stop
      end
C----------
