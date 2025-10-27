# Backend PHP - Cafetería Fanny

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

Actualiza el `eventService.js` en tu proyecto React:

```javascript
const API_BASE_URL = 'http://localhost:8000/backend/api';

export const eventService = {
  async getAllEvents() {
    const response = await fetch(`${API_BASE_URL}/events/`);
    const data = await response.json();
    return data.records || [];
  },

  async getEventById(id) {
    const response = await fetch(`${API_BASE_URL}/events/show.php?id=${id}`);
    return await response.json();
  }
};
```
