<?php
/**
 * Modelo Event
 * Archivo: models/Event.php
 */

class Event {
    private $conn;
    private $table_name = "events";

    public $id;
    public $title;
    public $subtitle;
    public $description;
    public $full_description;
    public $event_date;
    public $location;
    public $attendees;
    public $image;
    public $banner_image;
    public $is_active;
    public $created_at;
    public $updated_at;

    public function __construct($db) {
        $this->conn = $db;
    }

    /**
     * Obtener todos los eventos
     */
    function getAllEvents() {
        $query = "SELECT 
                    id, title, subtitle, description, event_date, 
                    location, attendees, image, banner_image, 
                    is_active, created_at, updated_at
                  FROM " . $this->table_name . " 
                  WHERE is_active = 1 
                  ORDER BY created_at DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    /**
     * Obtener un evento por ID
     */
    function getEventById($id) {
        $query = "SELECT 
                    id, title, subtitle, description, full_description, 
                    event_date, location, attendees, image, banner_image, 
                    is_active, created_at, updated_at
                  FROM " . $this->table_name . " 
                  WHERE id = ? AND is_active = 1 
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $id);
        $stmt->execute();

        if($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->id = $row['id'];
            $this->title = $row['title'];
            $this->subtitle = $row['subtitle'];
            $this->description = $row['description'];
            $this->full_description = $row['full_description'];
            $this->event_date = $row['event_date'];
            $this->location = $row['location'];
            $this->attendees = $row['attendees'];
            $this->image = $row['image'];
            $this->banner_image = $row['banner_image'];
            $this->is_active = $row['is_active'];
            $this->created_at = $row['created_at'];
            $this->updated_at = $row['updated_at'];
            return true;
        }
        return false;
    }

    /**
     * Obtener servicios de un evento
     */
    function getEventServices($event_id) {
        $query = "SELECT service_name, display_order 
                  FROM event_services 
                  WHERE event_id = ? 
                  ORDER BY display_order ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $event_id);
        $stmt->execute();

        return $stmt;
    }

    /**
     * Obtener galería de un evento
     */
    function getEventGallery($event_id) {
        $query = "SELECT image_url, display_order 
                  FROM event_gallery 
                  WHERE event_id = ? 
                  ORDER BY display_order ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $event_id);
        $stmt->execute();

        return $stmt;
    }

    /**
     * Obtener testimonio de un evento
     */
    function getEventTestimonial($event_id) {
        $query = "SELECT testimonial_text, author_name, author_position 
                  FROM event_testimonials 
                  WHERE event_id = ? 
                  LIMIT 1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $event_id);
        $stmt->execute();

        return $stmt;
    }
}
?>
