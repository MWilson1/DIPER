;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Document name: messdip.pro
; Created by:    judge, August 7, 2006
;
; Last Modified: Thu Aug 10 20:32:59 2006 by judge (judge) on edlen.local
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
PRO messdip,text,inform = inform
;
COMMON mesdip, call, widok,wbase,lulog,file
IF(n_elements(call) EQ 0) THEN call = 0
;
IF(call EQ 0) THEN BEGIN 
   widok = have_widgets()
ENDIF 
return

widok=0  ; switch off message in xtext window, it is too painful
;
IF(widok AND !d.name EQ 'X') THEN BEGIN 
   CASE (call) OF
      0: BEGIN 
         xtext,'Messages from DIPER appear here', $
            title = 'DIPER Messages',xsize = 70,ysize = 40,wbase = wbase,/just 
         call = 1
         s = systime()
         s = strcompress(getwrd(s,2,20),/rem)
         dir = curdir() 
         file = concat_dir(dir, 'diplog.'+s)
         xtext,'logged to '+file,/append,wbase = wbase
         lulog = 127
         openw,lulog,file
         printf,lulog,'diper logfile for '+systime(0)
         printf,lulog,!version
         printf,lulog,!diperv
      END
      1: BEGIN
         free_lun,lulog
         openu,lulog,file,/append
         printf,lulog,text
         IF(n_elements(inform) EQ 0) THEN BEGIN 
            xtext,text+': stop',/append,wbase = wbase
            stop
         ENDIF ELSE IF inform EQ 0 THEN BEGIN 
            xtext,text+': stop',/append,wbase = wbase
            stop
         ENDIF ELSE $
            xtext,text,/append,wbase = wbase
      END
   ENDCASE
ENDIF ELSE BEGIN 
   message,/noname,text,inform = inform
   ;free_lun,lulog
   ;openu,lulog,file,/append
   ;printf,lulog,text
ENDELSE
return
END



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; End of 'messdip.pro'.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
