mypc<-Sys.info()[4]
iam <- 0
if(mypc=="D01RI1600881") iam="adrianjrc"
if(mypc=="L01RI1203587") iam="adrianlaptop"
if(mypc=="D01RI1701864") iam="xavijrc"
if(mypc=="S-JRCIPRAP246P")   iam="serverJRC"

if(iam=="adrianjrc"){
  capripath<-"X:\\ec3\\gams"
  gamspath<-"C:\\Program Files\\GAMS\\win64\\24.8\\"
  CAPRIcallR_path <- ""
  
}else if(iam=="adrianlaptop"){
  capripath<-"C:\\ecampa3\\gams"
  gamspath<-"C:\\GAMS\\win64\\24.4"
  CAPRIcallR_path <- ""
  
}else if(iam=="xavijrc"){
  gamspath<-"C:\\apps\\GAMS\\win64\\24.9"
  capripath<-"E:\\epnf"
  CAPRIcallR_path <- ""

}else if(iam=="serverJRC"){
  if (as.vector(Sys.info()[7]) == "rotllxa"){
    gamspath <- "C:\\Apps\\GAMS\\win64\\25.1"
    capripath <- "D:\\dev\\CAPRImodel\\epnf"
    CAPRIcallR_path <- "C:\\Users\\rotllxa\\Documents\\caprilaunch"
  } else{
    iam <- "marsbl1bhl_al"
    gamspath <- ""
    capripath <- ""
    CAPRIcallR_path <- ""
  }
  
}else{
  gamspath <- ""
  capripath <- ""
  CAPRIcallR_path <- ""
  
}


setwd(paste0(capripath, "/GUI/"))
getwd()
source(paste0(CAPRIcallR_path, "/batch_file.r"))

ini_file <- "S-JRCIPRAP246Protllxa.ini"
btch_fle <- "batchfiles/epnfal_xavi.gms"

fcurrun <- paste0(capripath, "/GUI/", btch_fle)


batch_file(fcurrun = fcurrun,
           gamsexe = paste0(gamspath, "/gams.exe"), 
           work_dir = "../gams",
           dat_dir = "../dat")

#btch_fle <- "batchfiles/epnfal_xavi_old.gms"

gams2run <- paste("java", "-Xmx1G", "-Xverify:none", "-XX:+UseParallelGC", "-XX:PermSize=20M", "-XX:MaxNewSize=32M", "-XX:NewSize=32M", 
                  "-Djava.library.path=jars", "-classpath", 
                  "jars/gig.jar", "de.capri.ggig.BatchExecution",
                  ini_file, "capri_gui_definition.xml", 
                  btch_fle, sep = " ")

system(gams2run)
