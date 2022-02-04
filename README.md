# Instrucciones:

### Creación de la VM y configuración:

* Ejecutar el siguiente comando para crear la VM:
    * `vagrant up`

* Ejecutar el siguiente comando para instalar `coreemu` y `frr` (debe hacerse de esta manera porque es necesario desloguearse para crear los PATHS necesarios):
    ```bash
    vagrant ssh -c \
        "cd core-release-8.0.0; \
        inv install -o --no-ospf; \
        sudo apt-get -y install frr; \
        sudo systemctl enable core-daemon; \
        sudo systemctl start core-daemon; \
        sudo systemctl enable frr.service; \
        sudo systemctl start frr.service"
    ```


### Acceso a la VM:

* Ejecutar el siguiente comando para ingresar a la VM por SSH y ***forwardear*** las X (la opción `-vvv` es para debugear, puede omitirse del comando):

    * `vagrant ssh -- -vvv -X` 
    o 
    * `vagrant ssh -- -X`

* Ejecutar CORE dentro de la VM:
    * `core-gui-legacy`

