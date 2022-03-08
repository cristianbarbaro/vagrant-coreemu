# Instrucciones:

### Instalar Virtualbox y Vagrant 

* https://www.virtualbox.org/wiki/Downloads
* https://www.vagrantup.com/downloads

### Creación de la VM y configuración:

* Ejecutar el siguiente comando para clonar el repositorio:
    * `git clone <link-repo.git>`

* Entrar a la carpeta del repositorio:
    * `cd vagrant-coreemu`

### Iniciar la VM (la primera vez la descarga e instala):

* Pararse een el directorio del repositorio y ejecutar el siguiente comando:

    * `vagrant up`

### Entrar a la VM:

* Al terminar de instalar abrira el login con el usuario Ubuntu, hacer click y cambiarlo por el usuario `vagrant`
    * User: `vagrant`
    * Password: `vagrant`

### Para apagarla:

* Ejecutar el comando `vagrant halt`

### Exportar OVA:

* Ir al VirtualBox
* Seleccionar la VM de `pythonvm`
* Ir al menu superior `Archivo` y seleccionar `Exportar Servicio Virtualizado...`

