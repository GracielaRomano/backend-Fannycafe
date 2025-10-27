# Documentación Backend PHP/MySQL - Cafetería Fanny

## Requisitos Previos

### Software Necesario
- 
- **PHP** 7.4 o superior
- **MySQL** 5.7 o superior

- **Navegador web** (Chrome, Firefox, Edge)

### Conocimientos Recomendados
- Conceptos básicos de bases de datos relacionales
- Conocimiento básico de PHP
- Familiaridad con APIs REST
- Conceptos básicos de React

## Configuración de la Base de Datos

### Paso 1: Crear la Base de Datos
1. Abre phpMyAdmin (`http://localhost/phpmyadmin`)
2. Haz clic en la pestaña **"SQL"**
3. Copia y pega el contenido del archivo `SQL_COMPLETO.sql`
4. Haz clic en **"Continuar"** o **"Go"**

### Paso 2: Verificar la Creación
Después de ejecutar el script, deberías ver:
- Base de datos: `cafeteria_fanny`
- Tablas: `events`, `event_services`, `event_gallery`, `event_testimonials`
- Datos: 8 eventos completos con todos sus datos relacionados

### Estructura de la Base de Datos

#### Tabla `events`
```sql
- id (INT, PRIMARY KEY, AUTO_INCREMENT)
- title (VARCHAR(255))
- subtitle (VARCHAR(255))
- description (TEXT)
- full_description (TEXT)
- event_date (VARCHAR(100))
- location (VARCHAR(255))
- attendees (VARCHAR(100))
- image (VARCHAR(255))
- banner_image (VARCHAR(255))
- is_active (TINYINT(1))
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)
```

#### Tabla `event_services`
```sql
- id (INT, PRIMARY KEY, AUTO_INCREMENT)
- event_id (INT, FOREIGN KEY)
- service_name (VARCHAR(255))
- display_order (INT)
- created_at (TIMESTAMP)
```

#### Tabla `event_gallery`
```sql
- id (INT, PRIMARY KEY, AUTO_INCREMENT)
- event_id (INT, FOREIGN KEY)
- image_url (VARCHAR(255))
- display_order (INT)
- created_at (TIMESTAMP)
```

#### Tabla `event_testimonials`
```sql
- id (INT, PRIMARY KEY, AUTO_INCREMENT)
- event_id (INT, FOREIGN KEY)
- testimonial_text (TEXT)
- author_name (VARCHAR(255))
- author_position (VARCHAR(255))
- created_at (TIMESTAMP)
```

## Descripción
Backend API REST para la gestión de eventos de la Cafetería Fanny.

## Estructura
```
backend/
├── config/
│   └── database.php          # Configuración de la base de datos
├── models/
│   └── Event.php             # Modelo para eventos
├── api/
│   └── events/
│       ├── index.php         # GET /api/events/ - Listar todos los eventos
│       └── show.php          # GET /api/events/show.php?id=X - Obtener evento por ID
├── .htaccess                 # Configuración de Apache
└── README.md                 # Este archivo
```

## Instalación

### Requisitos
- PHP 7.4 o superior
- MySQL 5.7 o superior
- Base de datos `cafeteria_fanny` creada

### Configuración
1. Asegúrate de que la base de datos `cafeteria_fanny` existe
2. Verifica las credenciales en `config/database.php`
3. Inicia el servidor PHP interno:
   ```bash
   php -S localhost:8000
   ```

## Endpoints

### GET /api/events/
Obtiene todos los eventos activos.

**URL:** `http://localhost:8000/backend/api/events/`

**Respuesta:**
```json
{
  "records": [
    {
      "id": 1,
      "title": "Evento La Rural",
      "subtitle": "Congreso Argentino de Cardiología (SAC)",
      "description": "Servicio de café premium...",
      "event_date": "15 al 17 de Octubre, 2025",
      "location": "La Rural - Predio Ferial, Buenos Aires",
      "attendees": "500+ profesionales",
      "image": "/assets/images/laRural/caratula.jpg",
      "banner_image": "/assets/images/laRural/caratula.jpg",
      "is_active": 1,
      "created_at": "2024-01-01 00:00:00",
      "updated_at": "2024-01-01 00:00:00"
    }
  ]
}
```

### GET /api/events/show.php?id=X
Obtiene un evento específico por ID con todos sus datos relacionados.

**URL:** `http://localhost:8000/backend/api/events/show.php?id=1`

**Respuesta:**
```json
{
  "id": 1,
  "title": "Evento La Rural",
  "subtitle": "Congreso Argentino de Cardiología (SAC)",
  "description": "Servicio de café premium...",
  "full_description": "El Congreso Argentino de Cardiología...",
  "event_date": "15 al 17 de Octubre, 2025",
  "location": "La Rural - Predio Ferial, Buenos Aires",
  "attendees": "500+ profesionales",
  "image": "/assets/images/laRural/caratula.jpg",
  "banner_image": "/assets/images/laRural/caratula.jpg",
  "is_active": 1,
  "created_at": "2024-01-01 00:00:00",
  "updated_at": "2024-01-01 00:00:00",
  "services": [
    "Máquinas de café profesionales",
    "Baristas especializados",
    "Variedad de cápsulas premium"
  ],
  "gallery": [
    "/assets/images/laRural/caratula.jpg",
    "/assets/images/laRural/caratula.jpg"
  ],
  "testimonial": {
    "text": "El servicio de café fue excepcional...",
    "author": "Dr. Carlos Mendoza",
    "position": "Director del Congreso SAC"
  }
}
```

## Testing

### Usando cURL
```bash
# Obtener todos los eventos
curl -X GET http://localhost:8000/backend/api/events/

# Obtener evento específico
curl -X GET http://localhost:8000/backend/api/events/show.php?id=1
```

### Usando el navegador
- `http://localhost:8000/backend/api/events/`
- `http://localhost:8000/backend/api/events/show.php?id=1`

## Integración con React

### 1. Modificar `eventService.js`

```javascript
// src/services/eventService.js

const API_BASE_URL = 'http://localhost/backend/api';

export const eventService = {
  // Obtener todos los eventos
  async getAllEvents() {
    try {
      const response = await fetch(`${API_BASE_URL}/events/`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      return data.records || [];
    } catch (error) {
      console.error('Error fetching events:', error);
      throw error;
    }
  },

  // Obtener evento por ID
  async getEventById(id) {
    try {
      const response = await fetch(`${API_BASE_URL}/events/show.php?id=${id}`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      return data;
    } catch (error) {
      console.error('Error fetching event:', error);
      throw error;
    }
  }
};
```
### 2. Actualizar `Events.jsx`

```javascript
// src/pages/Events.jsx
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { eventService } from '../services/eventService';

const Events = () => {
  const [events, setEvents] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchEvents = async () => {
      try {
        setLoading(true);
        const data = await eventService.getAllEvents();
        setEvents(data);
      } catch (err) {
        setError(err.message);
        console.error('Error loading events:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchEvents();
  }, []);

  // ... resto del componente
};
```

### 3. Actualizar `EventDetail.jsx`

```javascript
// src/pages/EventDetail.jsx
import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { eventService } from '../services/eventService';

const EventDetail = () => {
  const { id } = useParams();
  const [event, setEvent] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchEvent = async () => {
      try {
        setLoading(true);
        const data = await eventService.getEventById(id);
        setEvent(data);
      } catch (err) {
        setError(err.message);
        console.error('Error loading event:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchEvent();
  }, [id]);

  // ... resto del componente
};
```
---

## Troubleshooting

### Problema: Error de Conexión a la Base de Datos
**Síntomas:** Error "Connection failed" en el navegador
**Solución:**
1. Verificar que MySQL esté ejecutándose en XAMPP
2. Verificar las credenciales en `config/database.php`
3. Verificar que la base de datos `cafeteria_fanny` existe

### Problema: Error 404 en las URLs de la API
**Síntomas:** "Not Found" al acceder a los endpoints
**Solución:**
1. Verificar que mod_rewrite esté habilitado
2. Verificar que el archivo `.htaccess` esté en la raíz del proyecto
3. Verificar la configuración de Apache

### Problema: Error CORS en React
**Síntomas:** "CORS policy" error en la consola del navegador
**Solución:**
1. Verificar que los headers CORS estén configurados en PHP
2. Verificar que el archivo `.htaccess` incluya las reglas CORS
3. En desarrollo, usar `http://localhost` en lugar de `http://127.0.0.1`

### Problema: Imágenes no se muestran
**Síntomas:** Las imágenes de los eventos no cargan
**Solución:**
1. Verificar que las rutas de las imágenes sean correctas
2. Verificar que los archivos de imagen existan en la carpeta `public`
3. Ajustar las rutas en la base de datos si es necesario

---

## FAQ

### P: ¿Puedo usar otro servidor web además de Apache?
R: Sí, puedes usar Nginx, pero necesitarás configurar las reglas de reescritura de URL de manera diferente.

### P: ¿Cómo cambio el puerto de Apache?
R: Edita el archivo `httpd.conf` y cambia `Listen 80` por `Listen 8080` (o el puerto que prefieras).

### P: ¿Puedo usar una base de datos diferente a MySQL?
R: Sí, pero necesitarás modificar la clase `Database` y las consultas SQL para que sean compatibles con tu SGBD.

### P: ¿Cómo agrego más endpoints?
R: Crea nuevos archivos PHP en la carpeta `api/` y agrega las reglas correspondientes en `.htaccess`.

### P: ¿Cómo hago backup de la base de datos?
R: Usa phpMyAdmin > Exportar, o ejecuta `mysqldump -u root -p cafeteria_fanny > backup.sql` en la terminal.

---