# Executando na máquina do jenkis

files_host=pmatrd00001d
dashboard_host=pmatrd00002d
injector_host=pmatrd00003d
bsa_primary_host=pmatrd00004d
load_file=massa001.txt
tibcp_instalation=tibcp001


#Copia massas
scp -r $files_host:/files/loads/$load_file /tmp/load
scp -r /tmp/load $injector_host:/injector/loads/$load_file

#copia tibcp
scp -r $files_host:/files/tibcps/$tibcp_instalation /tmp/tibcp
scp -r /tmp/tibcp $injector_host:/injector/tibcp/

#start bsa
ssh  $bsa_primary_host '/apps/bsa/scripts/startJava instanciaX'

#start injeção
ssh  $injector_host '/injector/tibcp/inject.ssh $load_file'

# espera a injeção acabar

#stop bsa
ssh  $bsa_primary_host '/apps/bsa/scripts/stopJava instanciaX'

#copia logs para "storage"
scp -r $bsa_primary_host:/apps/bsa/logs /tmp/logs
scp -r /tmp/logs $files_host:/files/executions/$bsa_version/timestamp/logs/

#verifica critérios de aceite
scp -r /tmp/logs $dashboard_host:/files/executions/$bsa_version/timestamp/logs/
ssh $dashboard_host "bash verificador-de-criterios.sh $dashboard_host:/files/executions/$bsa_version/timestamp/logs/ "

#importa HDRs
ssh $dashboard_host "importador_de_HDRs.sh $dashboard_host:/files/executions/$bsa_version/timestamp/logs/ "