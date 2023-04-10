json.extract! admin_ticket, :id, :name, :price, :ticket_type, :vip_seats, :regular_seats, :admin_event_id, :created_at, :updated_at
json.url admin_ticket_url(admin_ticket, format: :json)
