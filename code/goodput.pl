# type: perl throughput.pl <trace file> <required node> <granlarity>   >        output file


$infile=$ARGV[0];
$granularity=$ARGV[1];


#we compute how many bytes were transmitted during time interval specified
#by granularity parameter in seconds
$sum=0;
$clock=0;


          open (DATA,"<$infile")
            || die "Can't open $infile $!";
 
        while (<DATA>) {
                 @x = split(' ');


#column 1 is time
if ($x[1]-$clock <= $granularity)
{
#checking if the event corresponds to a reception
if ($x[0] eq 'r')
{
if ($x[3] eq 'MAC')
{
#checking if the destination corresponds to arg 1
if ($x[2] eq "_18_") #change according to your destination node
{
#checking if the packet type is CBR
if ($x[6] eq 'cbr')
{
        $sum=$sum+$x[7];
}
}
}
}
}
else
{   $throughput=$sum/$granularity;
        print STDOUT "$x[1] $throughput\n";
        $clock=$clock+$granularity;
        $sum=0;
}   
}
   $throughput=$sum/$granularity;
        print STDOUT "$x[1] $throughput\n";
        $clock=$clock+$granularity;
        $sum=0;


        close DATA;
exit(0);