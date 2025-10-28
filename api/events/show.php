<?php
/**
 * API Endpoint: Obtener evento por ID
 * Archivo: api/events/show.php
 * Método: GET
 * URL: http://localhost:8000/backend/api/events/show.php?id=1
 */


include_once __DIR__ . '/../../config/database.php';
include_once __DIR__ . '/../../models/Event.php';

$database = new Database();
$db = $database->getConnection();

$event = new Event($db);

$id = isset($_GET['id']) ? $_GET['id'] : die();

if($event->getEventById($id)) {
    // Obtener servicios
    $services_stmt = $event->getEventServices($event->id);
    $services = array();
    while ($service = $services_stmt->fetch(PDO::FETCH_ASSOC)) {
        $services[] = $service['service_name'];
    }

    // Obtener galería
    $gallery_stmt = $event->getEventGallery($event->id);
    $gallery = array();
    while ($img = $gallery_stmt->fetch(PDO::FETCH_ASSOC)) {
        $gallery[] = $img['image_url'];
    }

    // Obtener testimonio
    $testimonial_stmt = $event->getEventTestimonial($event->id);
    $testimonial = null;
    if($testimonial_stmt->rowCount() > 0) {
        $testimonial_row = $testimonial_stmt->fetch(PDO::FETCH_ASSOC);
        $testimonial = array(
            "text" => $testimonial_row['testimonial_text'],
            "author" => $testimonial_row['author_name'],
            "position" => $testimonial_row['author_position']
        );
    }

    $event_arr = array(
        "id" => $event->id,
        "title" => $event->title,
        "subtitle" => $event->subtitle,
        "description" => $event->description,
        "full_description" => $event->full_description,
        "event_date" => $event->event_date,
        "location" => $event->location,
        "attendees" => $event->attendees,
        "image" => $event->image,
        "banner_image" => $event->banner_image,
        "is_active" => $event->is_active,
        "created_at" => $event->created_at,
        "updated_at" => $event->updated_at,
        "services" => $services,
        "gallery" => $gallery,
        "testimonial" => $testimonial
    );

    http_response_code(200);
    echo json_encode($event_arr);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "Evento no encontrado."));
}
?>
