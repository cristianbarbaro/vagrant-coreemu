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
    * `core-gui`

#### Si hay problemas al crear la interfaz hostonly:

```
==> default: Clearing any previously set network interfaces...
There was an error while executing `VBoxManage`, a CLI used by Vagrant
for controlling VirtualBox. The command and stderr is shown below.

Command: ["hostonlyif", "ipconfig", "vboxnet0", "--ip", "192.168.100.1", "--netmask", "255.255.255.0"]

Stderr: VBoxManage: error: Code E_ACCESSDENIED (0x80070005) - Access denied (extended info not available)
VBoxManage: error: Context: "EnableStaticIPConfig(Bstr(pszIp).raw(), Bstr(pszNetmask).raw())" at line 242 of file VBoxManageHostonly.cpp
```

* Crear/editar archivo /etc/vbox/networks.conf que contiene las redes disponibles para vagrant y aplicar el siguiente contenido:

```
* 0.0.0.0/0 ::/0
```
