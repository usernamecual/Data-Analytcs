Markdown
# 🛒 RetailPro — Análisis de Datos y Consultas SQL

## 📌 Descripción del Proyecto
**RetailPro** es un proyecto de análisis de datos enfocado en el sector de retail. El objetivo principal es modelar la información de ventas, clientes, productos y categorías mediante un esquema relacional/dimensional, y responder a preguntas de negocio clave utilizando SQL.

---

## 🗂️ Estructura del Modelo de Datos
El proyecto cuenta con las siguientes tablas principales:
* **`ventas`** (Tabla de hechos): Registra las transacciones (`fecha_venta`, `id_cliente`, `id_producto`, `cantidad`, `precio_unitario`).
* **`clientes`** (Dimensión): Contiene la información de los clientes (`id_cliente`, `nombre`, `ciudad`).
* **`productos`** (Dimensión): Contiene el catálogo de productos (`id_producto`, `nombre_producto`, `id_categoria`).
* **`categorias`** (Dimensión): Define las categorías de producto y sus descripciones (`id_categoria`, `nombre_categoria`, `descripcion`).

---

## 📊 Vistas y Consultas Destacadas
* **Vista Base de Integración (`INNER JOIN`):** Consulta que unifica ventas con sus dimensiones correspondientes para obtener el desglose por cliente, producto, categoría y total facturado.
* **Métricas Comerciales:** Consultas agregadas para calcular total facturado, ticket promedio, ventas por cliente y desempeño mensual.
--**JUSTIFICACION 1** `ADEMAS DE LAS CONSULTAS DESTACADAS QUE MENCIONA, HAY MAS CONSULTAS CON UNION ALL AGRUPADAS POR CANAL, EN DONDE COMPARAMOS LAS VENTAS ENTRE MAYORISTAS Y MINORISTAS`--

---

## 💡 Hallazgos Clave para el Equipo Comercial
1. **Concentración de Facturación:** Cerca del 74% de los ingresos provienen de solo 2 clientes principales.
2. **Producto Estrella:** Un solo producto genera más del 55% del total facturado.
3. **Rendimiento Mensual:** El período evaluado superó la media general de ventas.
--**JUSTIFICACION 2** `AGREGO: POSIBILIDAD DE REALIZAR UPSELLING SOBRE LOS CLIENTES 2 Y 3`
---

## 🚀 Cómo Ejecutar el Proyecto
1. Clonar el repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/RetailPro.git](https://github.com/tu-usuario/RetailPro.git)

---

--**JUSTIFICACION 3** `UN PASO A PASO MAS CLARO`
## ⚙️ Cómo ejecutar los scripts SQL

Para replicar y probar este proyecto en tu entorno local (utilizando SQL Server Management Studio):

1. **Clonar o descargar** este repositorio en tu computadora.
2. Abrir **SQL Server Management Studio (SSMS)** y conectarte a tu servidor local.
3. Crear la base de datos ejecutando los comandos del archivo del modulo 3.
4. Generar las consultas usando los archivod del modulo 4 y 5.
  
