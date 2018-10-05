#===================================
#         Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel        ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy                ;# network interface type
set val(mac)        Mac/802_11                     ;# MAC type
set val(ifq)        Queue/DropTail/PriQueue        ;# interface queue type
set val(ll)         LL                             ;# link layer type
set val(ant)        Antenna/OmniAntenna            ;# antenna model
set val(ifqlen) 50                             ;# max packet in ifq
set val(nn)         25                             ;# number of mobilenodes
set val(rp)         AODV                          ;# routing protocol
set val(x)          1186                          ;# X dimension of topography
set val(y)          584                          ;# Y dimension of topography
set val(stop)   100.0                             ;# time of simulation end
set val(t1)         0.0                             ;
set val(t2)         0.0                              ;  


#===================================
#            Initialization            
#===================================
#Create a ns simulator
set ns [new Simulator]


#Setup topography object
set topo           [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)


#Open the NS trace file
set tracefile [open bhaodv_out.tr w]
$ns trace-all $tracefile


#Open the NAM trace file
set namfile [open bhaodv_out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel


#===================================
#         Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                    -llType            $val(ll) \
                    -macType           $val(mac) \
                    -ifqType           $val(ifq) \
                    -ifqLen            $val(ifqlen) \
                    -antType           $val(ant) \
                    -propType          $val(prop) \
                    -phyType           $val(netif) \
                    -channel           $chan \
                    -topoInstance  $topo \
                    -agentTrace        ON \
                    -routerTrace   ON \
                    -macTrace          ON \
                    -movementTrace ON




#===================================
#            Nodes Definition            
#===================================
#Create 25 nodes
set n0 [$ns node]
$n0 set X_ 663
$n0 set Y_ 484
$n0 set Z_ 0.0
$ns initial_node_pos $n0 40


$n0 start
set n1 [$ns node]
$n1 set X_ 466
$n1 set Y_ 407
$n1 set Z_ 0.0
$ns initial_node_pos $n1 40
set n2 [$ns node]
$n2 set X_ 791
$n2 set Y_ 406
$n2 set Z_ 0.0
$ns initial_node_pos $n2 40
set n3 [$ns node]
$n3 set X_ 668
$n3 set Y_ 393
$n3 set Z_ 0.0
$ns initial_node_pos $n3 40
set n4 [$ns node]
$n4 set X_ 558
$n4 set Y_ 320
$n4 set Z_ 0.0
$ns initial_node_pos $n4 40
set n5 [$ns node]
$n5 set X_ 781
$n5 set Y_ 317
$n5 set Z_ 0.0
$ns initial_node_pos $n5 40
set n6 [$ns node]
$n6 set X_ 650
$n6 set Y_ 40.0
$n6 set Z_ 0.0
$ns initial_node_pos $n6 40
set n7 [$ns node]
$n7 set X_ 671
$n7 set Y_ 194
$n7 set Z_ 0.0
$ns initial_node_pos $n7 40
set n8 [$ns node]
$n8 set X_ 761
$n8 set Y_ 234
$n8 set Z_ 0.0
$ns initial_node_pos $n8 40
set n9 [$ns node]
$n9 set X_ 476
$n9 set Y_ 117
$n9 set Z_ 0.0
$ns initial_node_pos $n9 40
set n10 [$ns node]
$n10 set X_ 714
$n10 set Y_ 121
$n10 set Z_ 0.0
$ns initial_node_pos $n10 40
set n11 [$ns node]
$n11 set X_ 825
$n11 set Y_ 140
$n11 set Z_ 0.0
$ns initial_node_pos $n11 40
set n12 [$ns node]
$n12 set X_ 509
$n12 set Y_ 34
$n12 set Z_ 0.0
$ns initial_node_pos $n12 40
set n13 [$ns node]
$n13 set X_ 687
$n13 set Y_ 36
$n13 set Z_ 0.0
$ns initial_node_pos $n13 40
set n14 [$ns node]
$n14 set X_ 822
$n14 set Y_ 51
$n14 set Z_ 0.0
$ns initial_node_pos $n14 40
set n15 [$ns node]
$n15 set X_ 373
$n15 set Y_ 271
$n15 set Z_ 0.0
$ns initial_node_pos $n15 40
set n16 [$ns node]
$n16 set X_ 903
$n16 set Y_ 255
$n16 set Z_ 0.0
$ns initial_node_pos $n16 40
set n17 [$ns node]
$n17 set X_ 908
$n17 set Y_ 344
$n17 set Z_ 0.0
$ns initial_node_pos $n17 40
set n18 [$ns node]
$n18 set X_ 600
$n18 set Y_ 180
$n18 set Z_ 0.0
$ns initial_node_pos $n18 40
set n19 [$ns node]
$n19 set X_ 455
$n19 set Y_ 479
$n19 set Z_ 0.0
$ns initial_node_pos $n19 40
set n20 [$ns node]
$n20 set X_ 350
$n20 set Y_ 434
$n20 set Z_ 0.0
$ns initial_node_pos $n20 40
set n21 [$ns node]
$n21 set X_ 263
$n21 set Y_ 306
$n21 set Z_ 0.0
$ns initial_node_pos $n21 40
set n22 [$ns node]
$n22 set X_ 261
$n22 set Y_ 209
$n22 set Z_ 0.0
$ns initial_node_pos $n22 40
set n23 [$ns node]
$n23 set X_ 240
$n23 set Y_ 115
$n23 set Z_ 0.0
$ns initial_node_pos $n23 40
set n24 [$ns node]
$n24 set X_ 313
$n24 set Y_ 29
$n24 set Z_ 0.0
$ns initial_node_pos $n24 40




#===================================
#            Multiple blackhole nodes             
#===================================


$ns at 0.0 "[$n1 set ragent_] blackhole1"
$ns at 0.0 "[$n7 set ragent_] blackhole2"
$ns at 0.0 "[$n13 set ragent_] blackhole3"

#===================================
#            Add Labels              
#===================================
#$ns at 0.0 "$n1 color red"
$ns at 0.0 "$n1 label M1"
#$ns at 0.0 "$n7 color red"
$ns at 0.0 "$n7 label M2"
#$ns at 0.0 "$n13 color red"
$ns at 0.0 "$n13 label M3"
$ns at 0.0 "$n21 label S"
$ns at 0.0 "$n18 label D"
$ns at 0.0 "$n20 label S"
$ns at 0.0 "$n11 label S"
$ns at 0.0 "$n17 label S"



#===================================
#            Agents Definition            
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n21 $udp0
set null1 [new Agent/Null]
$ns attach-agent $n18 $null1
$ns connect $udp0 $null1
$udp0 set packetSize_ 1500


#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 1000
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ null
$ns at 1.0 "$cbr0 start"
$ns at 20.0 "$cbr0 stop"
#Setup a UDP connection
set udp1 [new Agent/UDP]
$ns attach-agent $n20 $udp1

set null2 [new Agent/Null]
$ns attach-agent $n18 $null2
$ns connect $udp1 $null1
$udp1 set packetSize_ 1500


#Setup a CBR Application over UDP connection
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 1000
$cbr1 set rate_ 1.0Mb
$cbr1 set random_ null
$ns at 20.0 "$cbr1 start"
$ns at 40.0 "$cbr1 stop"
#Setup a UDP connection
set udp3 [new Agent/UDP]
$ns attach-agent $n11 $udp3
set null3 [new Agent/Null]
$ns attach-agent $n18 $null3
$ns connect $udp3 $null1
$udp3 set packetSize_ 1500


#Setup a CBR Application over UDP connection
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp3
$cbr2 set packetSize_ 1000
$cbr2 set rate_ 1.0Mb
$cbr2 set random_ null
$ns at 40.0 "$cbr2 start"
$ns at 60.0 "$cbr2 stop"
set udp4 [new Agent/UDP]
$ns attach-agent $n17 $udp4
set null4 [new Agent/Null]
$ns attach-agent $n18 $null4
$ns connect $udp4 $null4
$udp4 set packetSize_ 1500


#Setup a CBR Application over UDP connection
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$cbr4 set packetSize_ 1000
$cbr4 set rate_ 1.0Mb
$cbr4 set random_ null
$ns at 60.0 "$cbr4 start"
$ns at 100.0 "$cbr4 stop"


#===================================
#            Applications Definition            
#===================================


#===================================
#            Termination            
#===================================
#Define a 'finish' procedure
proc finish {} {
        global ns tracefile namfile
        $ns flush-trace
        close $tracefile
        close $namfile
        exec nam bhaodv_out.nam &
        exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
        $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
