<?php
/**
 * API Endpoint: Obtener todos los eventos
 * Archivo: api/events/index.php
 * Método: GET
 * URL: http://localhost:8000/backend/api/events/
 */


include_once __DIR__ . '/../../config/database.php';
include_once __DIR__ . '/../../models/Event.php';

$database = new Database();
$db = $database->getConnection();

$event = new Event($db);
$stmt = $event->getAllEvents();
$num = $stmt->rowCount();

if($num > 0) {
    $events_arr = array();
    $events_arr["records"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $event_item = array(
            "id" => $id,
            "title" => $title,
            "subtitle" => $subtitle,
            "description" => $description,
            "event_date" => $event_date,
            "location" => $location,
            "attendees" => $attendees,
            "image" => $image,
            "banner_image" => $banner_image,
            "is_active" => $is_active,
            "created_at" => $created_at,
            "updated_at" => $updated_at
        );

        array_push($events_arr["records"], $event_item);
    }

    http_response_code(200);
    echo json_encode($events_arr);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "No se encontraron eventos."));
}
?>
