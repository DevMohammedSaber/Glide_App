Table User {
  id INT [pk, increment]
  username VARCHAR(50) [unique]
  email VARCHAR(100) [unique]
  password VARCHAR(255)
  phone VARCHAR(20)
  role ENUM('customer', 'driver', 'admin', 'dispatcher')
  is_vip BOOLEAN [default: false]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table CustomerProfile {
  id INT [pk, increment]
  user_id INT
  profile_picture VARCHAR(255)
  default_payment_method_id INT
  preferences JSON
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table DriverProfile {
  id INT [pk, increment]
  user_id INT
  license_number VARCHAR(50)
  license_expiry DATE
  rating DECIMAL(3,2)
  is_active BOOLEAN [default: true]
  current_zone_id INT
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table DriverVehicle {
  id INT [pk, increment]
  driver_profile_id INT
  vehicle_id INT
  is_primary BOOLEAN [default: false]
  assigned_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  unassigned_at TIMESTAMP [null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Vehicle {
  id INT [pk, increment]
  registration_number VARCHAR(20) [unique]
  type ENUM('taxi', 'bus', 'elderly_bus', 'rental', 'delivery')
  model VARCHAR(100)
  make VARCHAR(100)
  year INT
  color VARCHAR(50)
  capacity INT
  is_wheelchair_accessible BOOLEAN [default: false]
  status ENUM('available', 'on_trip', 'offline', 'maintenance') [default: 'offline']
  current_location_lat DECIMAL(10,8)
  current_location_lng DECIMAL(11,8)
  registration_expiry DATE
  insurance_expiry DATE
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Zone {
  id INT [pk, increment]
  name VARCHAR(100)
  city VARCHAR(100)
  coordinates JSON
  is_active BOOLEAN [default: true]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table SubZone {
  id INT [pk, increment]
  zone_id INT
  name VARCHAR(100)
  coordinates JSON
  is_active BOOLEAN [default: true]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Address {
  id INT [pk, increment]
  user_id INT
  name VARCHAR(100)
  category ENUM('residential', 'business', 'airport', 'hospital', 'other')
  address_line1 VARCHAR(255)
  address_line2 VARCHAR(255)
  city VARCHAR(100)
  state VARCHAR(100)
  postal_code VARCHAR(20)
  country VARCHAR(100)
  latitude DECIMAL(10,8)
  longitude DECIMAL(11,8)
  is_favorite BOOLEAN [default: false]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Service {
  id INT [pk, increment]
  name VARCHAR(100)
  type ENUM('taxi', 'bus', 'elderly_bus', 'car_rental', 'food_delivery', 'grocery_delivery', 'parcel_delivery', 'medicine_delivery', 'marketplace')
  description TEXT
  base_price DECIMAL(10,2)
  price_per_km DECIMAL(10,2)
  price_per_minute DECIMAL(10,2)
  commission_percentage DECIMAL(5,2)
  is_active BOOLEAN [default: true]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Ride {
  id INT [pk, increment]
  customer_id INT
  driver_id INT
  vehicle_id INT
  service_id INT
  pickup_address_id INT
  dropoff_address_id INT
  status ENUM('requested', 'assigned', 'in_progress', 'completed', 'cancelled')
  scheduled_time TIMESTAMP [null]
  pickup_time TIMESTAMP [null]
  dropoff_time TIMESTAMP [null]
  estimated_distance DECIMAL(10,2)
  estimated_duration INT
  estimated_fare DECIMAL(10,2)
  actual_fare DECIMAL(10,2)
  payment_method_id INT
  payment_status ENUM('pending', 'paid', 'failed', 'refunded')
  rating DECIMAL(3,2) [null]
  review TEXT [null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table RideStop {
  id INT [pk, increment]
  ride_id INT
  address_id INT
  sequence_number INT
  arrival_time TIMESTAMP [null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table BusSchedule {
  id INT [pk, increment]
  service_id INT
  vehicle_id INT
  route_name VARCHAR(100)
  departure_address_id INT
  arrival_address_id INT
  departure_time TIME
  arrival_time TIME
  days_of_week VARCHAR(20)
  is_active BOOLEAN [default: true]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table BusBooking {
  id INT [pk, increment]
  customer_id INT
  bus_schedule_id INT
  booking_date DATE
  seats_booked INT
  for_elderly BOOLEAN [default: false]
  wheelchair_needed BOOLEAN [default: false]
  status ENUM('confirmed', 'cancelled')
  qr_code VARCHAR(255)
  payment_method_id INT
  payment_status ENUM('pending', 'paid', 'failed', 'refunded')
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table CarRental {
  id INT [pk, increment]
  customer_id INT
  vehicle_id INT
  driver_id INT
  pickup_address_id INT
  dropoff_address_id INT
  pickup_time TIMESTAMP
  return_time TIMESTAMP
  with_chauffeur BOOLEAN [default: false]
  status ENUM('booked', 'in_progress', 'completed', 'cancelled')
  rental_price DECIMAL(10,2)
  security_deposit DECIMAL(10,2)
  payment_method_id INT
  payment_status ENUM('pending', 'paid', 'failed', 'refunded')
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Vendor {
  id INT [pk, increment]
  user_id INT
  business_name VARCHAR(255)
  business_type ENUM('restaurant', 'grocery', 'pharmacy', 'retail', 'other')
  description TEXT
  logo VARCHAR(255)
  address_id INT
  opening_hours JSON
  rating DECIMAL(3,2)
  is_active BOOLEAN [default: true]
  commission_percentage DECIMAL(5,2)
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Product {
  id INT [pk, increment]
  vendor_id INT
  name VARCHAR(255)
  description TEXT
  category VARCHAR(100)
  price DECIMAL(10,2)
  discount_price DECIMAL(10,2) [null]
  image VARCHAR(255)
  is_available BOOLEAN [default: true]
  preparation_time INT [null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Order {
  id INT [pk, increment]
  customer_id INT
  vendor_id INT
  driver_id INT
  service_id INT
  delivery_address_id INT
  status ENUM('placed', 'confirmed', 'preparing', 'ready_for_pickup', 'in_transit', 'delivered', 'cancelled')
  total_amount DECIMAL(10,2)
  delivery_fee DECIMAL(10,2)
  estimated_delivery_time TIMESTAMP
  actual_delivery_time TIMESTAMP [null]
  payment_method_id INT
  payment_status ENUM('pending', 'paid', 'failed', 'refunded')
  notes TEXT
  rating DECIMAL(3,2) [null]
  review TEXT [null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table OrderItem {
  id INT [pk, increment]
  order_id INT
  product_id INT
  quantity INT
  unit_price DECIMAL(10,2)
  total_price DECIMAL(10,2)
  special_instructions TEXT
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table PaymentMethod {
  id INT [pk, increment]
  user_id INT
  type ENUM('credit_card', 'debit_card', 'wallet', 'cash', 'bank_transfer')
  provider VARCHAR(100) [null]
  account_number VARCHAR(255) [null]
  expiry_date DATE [null]
  is_default BOOLEAN [default: false]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Wallet {
  id INT [pk, increment]
  user_id INT
  balance DECIMAL(10,2) [default: 0]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table Transaction {
  id INT [pk, increment]
  wallet_id INT
  amount DECIMAL(10,2)
  type ENUM('credit', 'debit')
  description TEXT
  reference_id VARCHAR(100) [null]
  status ENUM('pending', 'completed', 'failed', 'refunded')
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table Notification {
  id INT [pk, increment]
  user_id INT
  title VARCHAR(255)
  message TEXT
  type VARCHAR(50)
  related_id INT [null]
  is_read BOOLEAN [default: false]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table Message {
  id INT [pk, increment]
  sender_id INT
  receiver_id INT
  content TEXT
  is_voice_message BOOLEAN [default: false]
  is_read BOOLEAN [default: false]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table SosAlert {
  id INT [pk, increment]
  user_id INT
  ride_id INT
  order_id INT
  location_lat DECIMAL(10,8)
  location_lng DECIMAL(11,8)
  status ENUM('active', 'resolved')
  resolved_by INT
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

Table DocumentReminder {
  id INT [pk, increment]
  user_id INT
  vehicle_id INT
  document_type ENUM('license', 'registration', 'insurance', 'maintenance')
  expiry_date DATE
  reminder_date DATE
  is_notified BOOLEAN [default: false]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP
}

// Define all relationships explicitly here
Ref: "CustomerProfile"."user_id" > "User"."id"
Ref: "CustomerProfile"."default_payment_method_id" > "PaymentMethod"."id"
Ref: "DriverProfile"."user_id" > "User"."id"
Ref: "DriverProfile"."current_zone_id" > "Zone"."id"
Ref: "DriverVehicle"."driver_profile_id" > "DriverProfile"."id"
Ref: "DriverVehicle"."vehicle_id" > "Vehicle"."id"
Ref: "SubZone"."zone_id" > "Zone"."id"
Ref: "Address"."user_id" > "User"."id"
Ref: "Ride"."customer_id" > "User"."id"
Ref: "Ride"."driver_id" > "User"."id"
Ref: "Ride"."vehicle_id" > "Vehicle"."id"
Ref: "Ride"."service_id" > "Service"."id"
Ref: "Ride"."pickup_address_id" > "Address"."id"
Ref: "Ride"."dropoff_address_id" > "Address"."id"
Ref: "Ride"."payment_method_id" > "PaymentMethod"."id"
Ref: "RideStop"."ride_id" > "Ride"."id"
Ref: "RideStop"."address_id" > "Address"."id"
Ref: "BusSchedule"."service_id" > "Service"."id"
Ref: "BusSchedule"."vehicle_id" > "Vehicle"."id"
Ref: "BusSchedule"."departure_address_id" > "Address"."id"
Ref: "BusSchedule"."arrival_address_id" > "Address"."id"
Ref: "BusBooking"."customer_id" > "User"."id"
Ref: "BusBooking"."bus_schedule_id" > "BusSchedule"."id"
Ref: "BusBooking"."payment_method_id" > "PaymentMethod"."id"
Ref: "CarRental"."customer_id" > "User"."id"
Ref: "CarRental"."vehicle_id" > "Vehicle"."id"
Ref: "CarRental"."driver_id" > "User"."id"
Ref: "CarRental"."pickup_address_id" > "Address"."id"
Ref: "CarRental"."dropoff_address_id" > "Address"."id"
Ref: "CarRental"."payment_method_id" > "PaymentMethod"."id"
Ref: "Vendor"."user_id" > "User"."id"
Ref: "Vendor"."address_id" > "Address"."id"
Ref: "Product"."vendor_id" > "Vendor"."id"
Ref: "Order"."customer_id" > "User"."id"
Ref: "Order"."vendor_id" > "Vendor"."id"
Ref: "Order"."driver_id" > "User"."id"
Ref: "Order"."service_id" > "Service"."id"
Ref: "Order"."delivery_address_id" > "Address"."id"
Ref: "Order"."payment_method_id" > "PaymentMethod"."id"
Ref: "OrderItem"."order_id" > "Order"."id"
Ref: "OrderItem"."product_id" > "Product"."id"
Ref: "PaymentMethod"."user_id" > "User"."id"
Ref: "Wallet"."user_id" > "User"."id"
Ref: "Transaction"."wallet_id" > "Wallet"."id"
Ref: "Notification"."user_id" > "User"."id"
Ref: "Message"."sender_id" > "User"."id"
Ref: "Message"."receiver_id" > "User"."id"
Ref: "SosAlert"."user_id" > "User"."id"
Ref: "SosAlert"."ride_id" > "Ride"."id"
Ref: "SosAlert"."order_id" > "Order"."id"
Ref: "SosAlert"."resolved_by" > "User"."id"
Ref: "DocumentReminder"."user_id" > "User"."id"
Ref: "DocumentReminder"."vehicle_id" > "Vehicle"."id"
