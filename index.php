<?php
/**
 * Router principal del backend
 * Archivo: index.php
 */

// Configurar headers CORS
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Manejar preflight requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Obtener la ruta solicitada
$request_uri = $_SERVER['REQUEST_URI'];
$path = parse_url($request_uri, PHP_URL_PATH);

// Remover el prefijo /backend si existe
$path = str_replace('/backend', '', $path);

// Routing
switch ($path) {
    case '/':
        if (file_exists('index.html')) {
            header('Content-Type: text/html');
            readfile('index.html');
            exit();
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Archivo index.html no encontrado."));
        }
        break;

    case '/api/events/':
    case '/api/events':
        include 'api/events/index.php';
        break;
        
    case '/api/events/show':
        include 'api/events/show.php';
        break;
        
    // Rutas del frontend de React - servir index.html
    case '/contacto':
    case '/nosotros':
    case '/servicios':
    case '/noticias':
    case '/inicio':
        if (file_exists('index.html')) {
            header('Content-Type: text/html');
            readfile('index.html');
            exit();
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Archivo index.html no encontrado."));
        }
        break;
        
    // Ruta especial para eventos que puede tener ID opcional
    case '/eventos':
        if (file_exists('index.html')) {
            header('Content-Type: text/html');
            readfile('index.html');
            exit();
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Archivo index.html no encontrado."));
        }
        break;
        
    default:
        // Si la ruta es /eventos/{id} del frontend
        if (preg_match('/^\/eventos\/(\d+)\/?$/', $path, $matches)) {
            if (file_exists('index.html')) {
                header('Content-Type: text/html');
                readfile('index.html');
                exit();
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Archivo index.html no encontrado."));
            }
        }
        
        // Si la ruta es para assets del frontend
        if (preg_match('/^\/src\/assets\/images\/(.+)$/', $path, $matches)) {
            $imagePath = '../cafeteriafanny/src/assets/images/' . $matches[1];
            if (file_exists($imagePath)) {
                $extension = pathinfo($imagePath, PATHINFO_EXTENSION);
                $mimeType = 'image/jpeg';
                switch (strtolower($extension)) {
                    case 'jpeg':
                        $mimeType = 'image/jpeg';
                        break;
                    case 'png':
                        $mimeType = 'image/png';
                        break;
                    case 'jpg':
                        $mimeType = 'image/jpg';
                        break;
                    case 'gif':
                        $mimeType = 'image/gif';
                        break;
                    case 'webp':
                        $mimeType = 'image/webp';
                        break;
                }
                header('Content-Type: ' . $mimeType);
                readfile($imagePath);
                exit();
            }
        }
        
        // Si la ruta contiene un ID de evento de la API
        if (preg_match('/^\/api\/events\/(\d+)\/?$/', $path, $matches)) {
            $_GET['id'] = $matches[1];
            include 'api/events/show.php';
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Endpoint no encontrado."));
        }
        break;
}
?>
