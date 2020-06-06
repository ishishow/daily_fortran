C----------
C234567
      integer k
      real a
      write(*,*) "test_1!"
      do k=1,10
      a=real(k)/5
      if(a.lt.1.60)then
      write(*,100)a
100   format(f5.2)
      endif
      enddo

      write(*,*) "test_2!"
      do k=1,10
      a=real(k)/5
      if(a.ge.0.40.and.a.le.1.80)then
      write(*,'(f5.2)')a
      endif
      enddo

      write(*,*) "test_3!"
      do k=1,10
      a=real(k)/5
      if(a.ge.0.20.and.a.le.0.60)then
      write(*,'(f5.2)')a
      endif
      if(a.ge.1.20.and.a.le.1.80)then
      write(*,'(f5.2)')a
      endif
      enddo

      write(*,*) "test_4!"
      do k=1,10
      a=real(k)/5
      if(mod(k,5).eq.0)then
      write(*,'(f5.2)')a
      endif
      enddo
      stop
      end
C----------
