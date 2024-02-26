create table retail_center (
    id serial primary key,
    type text,
    address text
);

create table shipped_item(
    item_num int primary key,
    retail_center_id int references retail_center(id),
    weight numeric(19, 0),
    dimension numeric(19, 0),
    insurance_amt numeric(19, 0),
    destination text,
    final_delivery_date timestamp
);

create table transportation_event (
    seq_number int primary key,
    type text,
    delivery_rout text
);

create table item_transportation(
    transportation_event_seq_number int references transportation_event(seq_number),
    shipped_item_item_num int references shipped_item(item_num)
);