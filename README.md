# Instrucciones:

### Creación de la VM y configuración:

* Ejecutar el siguiente comando para crear la VM:
    * `vagrant up`

* Ejecutar el siguiente comando para instalar `coreemu`:
    ```bash
    vagrant ssh -c \
        "cd core-release-8.0.0; \
        inv install; \
        sudo systemctl enable core-daemon; \
        sudo systemctl start core-daemon"
    ```


### Acceso a la VM:

* Ejecutar el siguiente comando para ingresar a la VM por SSH y ***forwardear*** las X:

    * `vagrant ssh -- -vvv -X`

* Ejecutar CORE dentro de la VM:
    * `core-gui-legacy`

