.text
     .globl main
main:
###float
    #print input msg
        li $v0, 4 #system output str
        la $a0, strinputmsg
        syscall #print msg
    #get data
        li $v0,8 #take in input
        la $a0, strbuffer #load byte space into address
        li $a1, 20 # allot the byte space for string
        move $t0,$a0 #save string to t0
        syscall
    #print output msg
        li $v0, 4 #system output str
        la $a0, commonoutputmsg
        syscall #print msg
        add $s1, $t0, 2
        add $s1, $s1, -1        
        lb $t2, 0($s1)
        lb $t3, 2($t0)

        sb $t2, 2($t0)
        sb $t3, 0($s1)
        li $v0, 1 #system output str
        lb $t1, 0($t0)
        move $a0, $t1
        syscall #print msg

    #print result
        la $a0, strbuffer #reload byte space to primary address
        move $a0,$t0 # primary address = t0 address (load pointer)
        li $v0,4 # print string
        syscall
    #end program
    li $v0,10
    syscall
     .data
        strbuffer: .space 20
        strinputmsg:  .asciiz "Enter string(max 20 chars): "
        commonoutputmsg:  .asciiz "You wrote:"