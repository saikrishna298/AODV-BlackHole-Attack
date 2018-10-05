# type: perl throughput.pl <trace file> <required node> <granlarity>   >        output file


$infile=$ARGV[0];
$snode1=$ARGV[1];
$snode2=$ARGV[2];
$snode3=$ARGV[3];
$snode4=$ARGV[4];
$dnode=$ARGV[5];


#we compute how many bytes were transmitted during time interval specified
#by granularity parameter in seconds
$scount=0;
$rcount=0;
$pdr=0;
$clock=0;


          open (DATA,"<$infile")
            || die "Can't open $infile $!";
 
        while (<DATA>) {
                 @x = split(' ');


#column 1 is time


#checking if the event corresponds to a reception
if ($x[0] eq 's')
{
if ($x[3] eq 'MAC')
{
#checking if the destination corresponds to arg 1
if (($x[2] eq $snode1) || ($x[2] eq $snode2) || ($x[2] eq $snode3)|| ($x[2] eq $snode4)) #change according to your destination node
{
#checking if the packet type is TCP
if ($x[6] eq 'cbr')
{
        $scount=$scount+1;
}
}
}
}


if ($x[0] eq 'r')
{
if ($x[3] eq 'MAC')
{
#checking if the destination corresponds to arg 1
if ($x[2] eq $dnode) #change according to your destination node
{
#checking if the packet type is TCP
if ($x[6] eq 'cbr')
{
        $rcount=$rcount+1;
}
}
}
}
}


   $pdr=$rcount/$scount;
        print STDOUT "PDR $pdr \n scount $scount rcount $rcount\n";
          $rcount=0;


        close DATA;
exit(0);