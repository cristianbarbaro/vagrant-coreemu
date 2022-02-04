# Instrucciones:

### Creación de la VM y configuración:

* Ejecutar el siguiente comando para crear la VM:
    * `vagrant up`


### Acceso a la VM:

* Ejecutar el siguiente comando para ingresar a la VM por SSH y ***forwardear*** las X (la opción `-vvv` es para debugear, puede omitirse del comando):

    * `vagrant ssh -- -vvv -X` 
    o 
    * `vagrant ssh -- -X`

* Ejecutar CORE dentro de la VM:
    * `core-gui-legacy`

