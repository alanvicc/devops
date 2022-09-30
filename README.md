## Sobre este projeto 
Laboratorios de estudo das ferramentas mais utilizadas em praticas DevSecOps

## Meu Perfil no Linkedin
<br/>
<a href="https://www.linkedin.com/in/alan-victor-222617205/">
    <img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" height="25"/>
  </a>
</div>
<br/>

## Tecnologias Utilizadas
 - Vagrant 

 
 - Ansible


 - Docker com Compose e Swarm


 - SonarQube com SonarScanner e Quality Gate 


 - Jenkins


 - Nexus


 - Kubernetes


 - Prometheus


 - Grafana


pipeline {
    options {
        office365ConnectorWebhooks([
            [name: "Office 365", url: "${URL_WEBHOOK}", notifyBackToNormal: true, notifyFailure: true, notifyRepeatedFailure: true, notifySuccess: true, notifyAborted: true]
        ])
    }
}


