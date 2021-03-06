;title	LPTPORT.ASM - Switch Printer Ports Between LPT1: and LPT2:
;
; (C) Copyright 1984, Dickinson Associates Inc.
;
ROM_BIOS_DATA	segment at 40h		; Low Memory "BIOS" Parameters at 40H
	org	8h			; Printer port addresses are at byte 8
	PRINTER_BASE	dw  4 dup(?)	; Four words for Printer Port
					; I/O Address Locations
ROM_BIOS_DATA	ends			; End of data segment
;
CODE_SEG    segment para 'code'
;
	assume	ds:ROM_BIOS_DATA, cs:CODE_SEG, ss:NOTHING, es:NOTHING
	org	100h			; .COM format program
;
BEGIN:
	mov	ax,ROM_BIOS_DATA	; Make ROM_BIOS_DATA addressable
	mov	ds,ax			; via DS register.
;
	mov	ax,PRINTER_BASE[0]	; Move LPT1: port address to AX
	mov	bx,PRINTER_BASE[2]	; Move LPT2: port address to BX
	mov	PRINTER_BASE[0],bx	; Switch the port addresses around
	mov	PRINTER_BASE[2],ax	; by moving them back in reverse order.
;
	ret				; Back to PC-DOS
;
CODE_SEG	ends			; End of code segment
;
	end	BEGIN			; End of program
                                                                  