# 🛠️ Proyecto de Alarmas con Flutter 

Este proyecto es una aplicación de gestión de alarmas desarrollada con **Flutter**. Permite crear, visualizar y gestionar alarmas con una interfaz moderna.

---

## 🚀 Tecnologías utilizadas
- [Flutter 3.2.9](https://flutter.dev/)


---

## 👥 Instalación y configuración

### 1️⃣ **Clonar el repositorio**
```sh
[git clone https://github.com/marvil98/chronos-web.git](https://github.com/Renvel19/chronos-mobile.git)
cd chronos-mobile
```

### 2️⃣ **Instalar dependencias**
```sh
flutter pub get
```

---

## ▶️ **Ejecutar el proyecto **
### Requisitos Previos
Antes de comenzar, asegúrate de tener instalado:
- Flutter SDK
- Android Studio (para emulador de Android)
- Xcode (solo para macOS, si deseas usar el simulador de iOS)
- Un editor de código como Visual Studio Code o Android Studio
- Un dispositivo móvil virtual configurado en Android Studio o Xcode
- Configurar un Dispositivo Virtual

### En Android Emulator

- Abre Android Studio.
- Ve a Tools > AVD Manager.
- Crea un nuevo dispositivo virtual (Create Virtual Device...).
- Selecciona un modelo de teléfono y haz clic en Next.
- Descarga y selecciona una imagen del sistema con Google APIs.
- Configura las opciones del emulador y haz clic en Finish.
- Inicia el emulador desde el AVD Manager.

### En iOS Simulator (macOS)

- Abre Xcode.
- Ve a Xcode > Settings > Platforms y asegúrate de que iOS esté instalado.
- Abre Xcode > Open Developer Tool > Simulator.
- Selecciona un dispositivo desde Device > Select Device.

### Ejecutar la Aplicación Flutter
- Verificar Dispositivos Disponibles
- Ejecuta el siguiente comando en la terminal para listar los dispositivos disponibles:
- flutter devices
- Ejecutar la Aplicación
- Ejecuta el siguiente comando para iniciar la aplicación en el emulador o simulador:
```sh
flutter run
```
- Si tienes varios dispositivos conectados, especifícalo con:
```sh
# Para obtener el DEVICE_ID, usa flutter devices.

flutter run -d <DEVICE_ID>
```

### Solución de Problemas

- No se reconoce el emulador: Asegúrate de haber iniciado el emulador antes de ejecutar flutter run.
- No se detecta un dispositivo virtual: Verifica que el SDK de Android esté configurado correctamente ejecutando flutter doctor.
- Errores en macOS: Confirma que tienes instalado Xcode y sus herramientas de línea de comandos (xcode-select --install).

### Referencias

- [Flutter Docs: Get started](https://docs.flutter.dev/get-started/install)
- [Flutter Docs: Testing & Debugging](https://docs.flutter.dev/testing/debugging)



## 🛠 **Estructura del proyecto**
```
📂 chronos-web
│── 📂 src
│   │── 📂 components   # Componentes reutilizables (Datepicker, Navbar y pop-ups.)
│   │── 📂 app        # Directorio principal de la aplicación
│   │── 📂 assets       # Íconos e imágenes
│── 📄 package.json     # Dependencias y scripts del proyecto
│── 📄 README.md        # Documentación del proyecto
```
---

